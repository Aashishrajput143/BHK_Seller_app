import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:bhk_seller_app/controller/getpendingproductcontroller.dart';
import 'package:bhk_seller_app/controller/getproductcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  GetPendingProductController controller =
      Get.put(GetPendingProductController());
  GetProductController approvedcontroller = Get.put(GetProductController());

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      Utils.closeKeyboard(Get.context!);

      if (tabController.index == 0) {
        approvedcontroller.getProductApi();
        print("1");
      } else if (tabController.index == 1) {
        controller.getPendingProductApi();
        print("2");
      } else if (tabController.index == 2) {
        print("3");
      } else if (tabController.index == 3) {
        print("4");
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
