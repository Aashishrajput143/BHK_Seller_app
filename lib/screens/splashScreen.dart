import 'package:bhk_seller_app/controller/splashController.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../Constants/constants.dart';

class SplashScreen extends ParentWidget {
  SplashController controller = Get.put(SplashController());

  SplashScreen({super.key});
  @override
  Widget buildingView(BuildContext context, double h, double w) {
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
