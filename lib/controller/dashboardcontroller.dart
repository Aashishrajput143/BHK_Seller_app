import 'dart:convert';

import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:bhk_seller_app/common/CommonMethods.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/model/getbrandModel.dart';
import 'package:bhk_seller_app/model/getcategorymodel.dart';
import 'package:bhk_seller_app/model/getproductmodel.dart';
import 'package:bhk_seller_app/model/salesgraphmodel.dart';
import 'package:bhk_seller_app/model/todayordermodel.dart';
import 'package:bhk_seller_app/repository/brandrepository.dart';
import 'package:bhk_seller_app/repository/orderrepository.dart';
import 'package:bhk_seller_app/repository/productrepository.dart';
import 'package:bhk_seller_app/repository/salesrepository.dart';
import 'package:bhk_seller_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Dashboardcontroller extends GetxController {
  final repository = ProductRepository();
  final salesrepository = SalesRepository();
  final orderrepository = OrderRepository();
  final brandrepository = BrandRepository();
  var chartData = <Map<String, dynamic>>[];
  int currentYear = DateTime.now().year;
  RxDouble scrollPosition = 0.0.obs;
  RxDouble maxScrollExtent = 0.0.obs;

  void updateScrollPosition(double position, double maxExtent) {
    if (position == 0.0) {
      scrollPosition.value = scrollPosition.value + 10.0;
    }
    scrollPosition.value = position;
    maxScrollExtent.value = maxExtent;
    print("scrollPosition========>$scrollPosition");
    print("maxScrollExtent========>$maxScrollExtent");
  }

  void showSuccessDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        //backgroundColor: Colors.black,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 30),
            ),
            SizedBox(height: 20),
            // Success Title
            Text(
              "Success!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Success Message
            Text(
              "You have successfully logged into the system",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 20),
            // Go to Main Screen Button
            ElevatedButton(
              onPressed: () {
                Get.back(); // Close the dialog and navigate to the main screen
                // Navigate to the main screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 118, 60, 31),
                minimumSize: Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Go to Dashboard",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showExitDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Row(
          children: [
            Icon(Icons.help_outline, color: Colors.orange, size: 30),
            SizedBox(width: 8),
            Text("Confirm Exit...!!!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        content: Text("Are you sure you want to exit?"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.back(); // Close dialog without doing anything
                },
                child: Text("CANCEL", style: TextStyle(color: Colors.pink)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close dialog and stay in the app
                    },
                    child: Text("NO", style: TextStyle(color: Colors.pink)),
                  ),
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop(); // Exit the app
                    },
                    child: Text("YES", style: TextStyle(color: Colors.pink)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onInit() {
    super.onInit();
    bool isDialog = Get.arguments?['isDialog'] ?? false;

    getCategoryApi();

    getSalesApi();
    getTodayorderApi();
    getBrandApi();
    getProductApi();
    getTrendingProductApi();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isDialog) {
        showSuccessDialog();
      }
    });
  }

  void setError(String value) => error.value = value;
  RxString error = ''.obs;

  var isLoading = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  final getCategoryModel = GetCategoryModel().obs;
  final getBrandModel = GetBrandModel().obs;
  final getSalesModel = SalesGraphModel().obs;
  final getTodayOrdersModel = TodayOrdersModel().obs;
  final getProductModel = GetProductModel().obs;
  final getTrendingProductModel = GetProductModel().obs;

  void setGetCategorydata(GetCategoryModel value) =>
      getCategoryModel.value = value;

  void setGetbranddata(GetBrandModel value) => getBrandModel.value = value;
  void setGetTotalSalesdata(SalesGraphModel value) =>
      getSalesModel.value = value;
  void setGettodayOrderdata(TodayOrdersModel value) =>
      getTodayOrdersModel.value = value;
  void setGetproductdata(GetProductModel value) =>
      getProductModel.value = value;
  void setGettrendingproductdata(GetProductModel value) =>
      getTrendingProductModel.value = value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getCategoryApi();
    getBrandApi();
    getSalesApi();
    getTodayorderApi();
    getTrendingProductApi();
    getProductApi();
  }

  Future<void> getBrandApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      brandrepository.getdashbrandApi(1).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetbranddata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Future<void> getSalesApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      int currentYear = DateTime.now().year;

      salesrepository.getsalesApi(currentYear).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetTotalSalesdata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        var monthsData = getSalesModel.value.data?.monthsData;

        chartData = monthsData?.map((data) {
              return {
                'month': data.month,
                'sales': data.sales,
              };
            }).toList() ??
            [];
        print("redirect");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Future<void> getTodayorderApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      orderrepository.gettodayorderApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGettodayOrderdata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog(
            "> ${getTodayOrdersModel.value.data?.totalCount.toString()}");
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Future<void> getCategoryApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getcategoryApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetCategorydata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Future<void> getProductApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getproductApi().then((value) {
        setGetproductdata(value);
        setRxRequestStatus(Status.COMPLETED);
        print(
            "set data===========>${getProductModel.value.data?.docs?.length}");
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
        Utils.printLog("Error===> ${stackTrace.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Future<void> getTrendingProductApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getTrendingproductApi().then((value) {
        setGettrendingproductdata(value);
        setRxRequestStatus(Status.COMPLETED);
        print(
            "set data===========>${getTrendingProductModel.value.data?.docs?.length}");
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
        Utils.printLog("Error===> ${stackTrace.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  Widget buildDashboardCard({
    required Color color,
    required IconData icon,
    required String amount,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Action when tapped
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(height: 16),
              Text(
                amount,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> dashboardRefresh() async {
    // Simulate network fetch or database query
    await Future.delayed(Duration(seconds: 2));
    // Update the list of items and refresh the UI
    getCategoryApi();
    getBrandApi();
    getSalesApi();
    getTodayorderApi();
    getProductApi();
    getTrendingProductApi();
    print("items.length");
  }
}
