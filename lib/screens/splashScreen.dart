import 'package:bhk_seller_app/controller/splashController.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';

class SplashScreen extends ParentWidget {
  const SplashScreen({super.key});
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    Get.put(SplashController());
    return Container(
        height: h,
        color: Colors.white,
        child: Center(
            child: Image.asset(
          Constant.backss,
          height: 125.0,
          width: 125.0,
        )));
  }
}
