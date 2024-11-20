import 'package:bhk_seller_app/screens/dashboardManagement/dashboard.dart';
import 'package:bhk_seller_app/screens/ordersManagement/order_screen.dart';
import 'package:bhk_seller_app/screens/productManagement/product_screen.dart';
import 'package:bhk_seller_app/screens/profileManagement/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonDashController extends GetxController {
  // Use an Rx to manage the selected screen index
  var selectedScreenIndex = 0.obs;

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

  // List of screens and titles
  final List<Map<String, dynamic>> screens = [
    {"screen": DashBoard(), "title": "HOME"},
    {"screen": ProductScreen(), "title": "MY PRODUCTS"},
    {"screen": OrderScreen(), "title": "ORDERS DETAILS"},
    {"screen": MainProfile(), "title": "Profile & More"}
  ];

  // Method to update the selected screen index
  dynamic selectScreen(int index) {
    selectedScreenIndex.value = index;
    print(selectedScreenIndex.value);
    return selectedScreenIndex.value;
  }
}
