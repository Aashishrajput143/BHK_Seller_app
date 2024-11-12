import 'dart:convert';

import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:bhk_seller_app/common/CommonMethods.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/model/productdetailsmodel.dart';
import 'package:bhk_seller_app/repository/productrepository.dart';
import 'package:bhk_seller_app/resources/strings.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductPreviewController extends GetxController {
  final repository = ProductRepository();
  var currentIndex = 0.obs;
  var slidercontroller = CarouselSliderController();

  @override
  void onInit() {
    super.onInit();
    int productId = Get.arguments['productid'];
    print(productId);
    getproductDetailsApi(productId);
  }

  int indexs = 1;

  var isLoading = false.obs;
  var isProductAdded = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;
  final getProductDetailsModel = ProductDetailsModel().obs;

  void setError(String value) => error.value = value;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setGetProductDetailsdata(ProductDetailsModel value) =>
      getProductDetailsModel.value = value;

  Future<void> getproductDetailsApi(productId) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.getproductdetailsApi(productId).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetProductDetailsdata(value);
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

  Widget productDetailRow(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title :'),
          Text(detail),
        ],
      ),
    );
  }
}
