import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/dashboard.dart';
import 'package:bhk_seller_app/screens/productManagement/my_products.dart';
import 'package:bhk_seller_app/screens/ordersManagement/orders_screen.dart';
import 'package:bhk_seller_app/screens/profileManagement/main_profile.dart';
import 'package:bhk_seller_app/widgets/appBardrawer.dart';
import 'package:bhk_seller_app/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDash extends StatefulWidget {
  final int index;

  const CommonDash({super.key, required this.index});

  @override
  State<CommonDash> createState() => _CommonDashState();
}

class _CommonDashState extends State<CommonDash> {
  late int selectedScreenIndex; // Local variable in the State class

  @override
  void initState() {
    super.initState();
    // Assign the widget's variable to the local variable
    selectedScreenIndex = widget.index;
  }

  List _screens = [
    {"screen": DashBoard(), "title": "HOME"},
    {"screen": MyProducts(), "title": "MY PRODUCTS"},
    {"screen": OrdersList(), "title": "ORDERS HISTORY"},
    {"screen": MainProfile(), "title": "Profile & More"}
  ];
  void _selectScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 243, 233),
      // Background color for the rest of the screen
      appBar: _screens[selectedScreenIndex]["title"] == "HOME"
          ? AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: AppConstants.customGradient,
                ),
              ), // Brown background color for the AppBar
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.white),
              toolbarHeight:
                  68, // Increases AppBar height to fit both the logo and text comfortably
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AppImages.logo),
                      radius: 22,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Business',
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
                //const SizedBox(width: 37),
                //const Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: MediaQuery.of(context).size.width * .265),
                IconButton(
                  icon:
                      const Icon(Icons.notifications_none, color: Colors.white),
                  onPressed: () {
                    Get.toNamed(RoutesClass.gotoNotificationScreen());
                  },
                ),
                //const SizedBox(width: 12),
                //const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                const SizedBox(width: 16),
              ],
            )
          : AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: AppConstants.customGradient,
                ),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                _screens[selectedScreenIndex]["title"].toUpperCase(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
      drawer: Appbardrawer(),
      body: _screens[selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomMenu(
        selectedIndex: selectedScreenIndex,
        onClicked: _selectScreen,
      ),
    );
  }
}
