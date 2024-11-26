import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      Utils.closeKeyboard(Get.context!);

      if (tabController.index == 0) {
        print("active");
      } else if (tabController.index == 1) {
        print("jjjj");
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
