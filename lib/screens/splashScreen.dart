import 'dart:math';

import 'package:bhk_seller_app/controller/splashcontroller.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../Constants/constants.dart';

class SplashScreen extends ParentWidget {
  const SplashScreen({super.key});
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(195, 247, 243, 233),
      body: Stack(
        children: [
          // Main content in the center
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: controller.animationController.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/images/splashscreenouter.png',
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 70,
                  height: 70,
                ),
              ],
            ),
          ),
          // "BHK Seller App" at the bottom center
          Positioned(
            bottom: 50, // Adjust the distance from the bottom as needed
            left: 0,
            right: 0,
            child: Text(
              "BHK Seller App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
                color:
                    Color.fromARGB(255, 123, 64, 35), // Adjust color as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
