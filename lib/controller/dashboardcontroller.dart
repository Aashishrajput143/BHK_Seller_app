import 'dart:convert';

import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:bhk_seller_app/common/CommonMethods.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/model/getbrandModel.dart';
import 'package:bhk_seller_app/model/getcategorymodel.dart';
import 'package:bhk_seller_app/model/getproductmodel.dart';
import 'package:bhk_seller_app/repository/productrepository.dart';
import 'package:bhk_seller_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboardcontroller extends GetxController {
  final repository = ProductRepository();

  @override
  void onInit() {
    super.onInit();
    getCategoryApi();
    getProductApi();
    getBrandApi();
  }

  void setError(String value) => error.value = value;
  RxString error = ''.obs;

  var isLoading = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  final getCategoryModel = GetCategoryModel().obs;
  final getBrandModel = GetBrandModel().obs;
  final getProductModel = GetProductModel().obs;

  void setGetCategorydata(GetCategoryModel value) =>
      getCategoryModel.value = value;

  void setGetbranddata(GetBrandModel value) => getBrandModel.value = value;
  void setGetproductdata(GetProductModel value) =>
      getProductModel.value = value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getCategoryApi();
    getBrandApi();
    getProductApi();
  }

  Future<void> getBrandApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getbrandApi().then((value) {
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
                  fontSize: 24,
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
    getProductApi();
    print("items.length");
  }
}
