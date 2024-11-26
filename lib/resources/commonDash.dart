import 'package:bhk_seller_app/controller/commondashcontroller.dart';
import 'package:bhk_seller_app/controller/orderscreencontroller.dart';
import 'package:bhk_seller_app/controller/productscreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:bhk_seller_app/widgets/appBardrawer.dart';

class CommonDash extends StatelessWidget {
  final int index;

  const CommonDash({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    CommonDashController controller = Get.put(CommonDashController());
    OrderController ordercontroller = Get.put(OrderController());
    ProductController productcontroller = Get.put(ProductController());

    return Obx(() {
      int selectedScreenIndex = controller.selectedScreenIndex.value;

      final isOrderDetailsPage =
          controller.screens[selectedScreenIndex]["title"] == "ORDERS DETAILS";
      final isHomePage =
          controller.screens[selectedScreenIndex]["title"] == "HOME";
      final isProductPage =
          controller.screens[selectedScreenIndex]["title"] == "MY PRODUCTS";

      return WillPopScope(
        onWillPop: () async {
          controller.showExitDialog();
          return false;
        },
        child: DefaultTabController(
          length: isOrderDetailsPage
              ? 2
              : isProductPage
                  ? 4
                  : 1,
          child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 247, 243, 233),
            appBar: isHomePage
                ? AppBar(
                    flexibleSpace: Container(
                      decoration: const BoxDecoration(
                        gradient: AppConstants.customGradient,
                      ),
                    ),
                    elevation: 0,
                    automaticallyImplyLeading: true,
                    iconTheme: const IconThemeData(color: Colors.white),
                    toolbarHeight: 68,
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
                      SizedBox(width: MediaQuery.of(context).size.width * .265),
                      IconButton(
                        icon: const Icon(Icons.notifications_none,
                            color: Colors.white),
                        onPressed: () {
                          Get.toNamed(RoutesClass.gotoNotificationScreen());
                        },
                      ),
                      const SizedBox(width: 16),
                    ],
                  )
                : isOrderDetailsPage
                    ? AppBar(
                        flexibleSpace: Container(
                          decoration: const BoxDecoration(
                            gradient: AppConstants.customGradient,
                          ),
                        ),
                        bottom: TabBar(
                          controller: ordercontroller.tabController,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          indicatorColor: Colors.green,
                          indicatorWeight: 4,
                          tabs: [
                            Tab(text: 'Active Orders'),
                            Tab(text: 'Past Orders'),
                          ],
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            height: 1.7,
                          ),
                        ),
                        centerTitle: true,
                        automaticallyImplyLeading: true,
                        iconTheme: const IconThemeData(color: Colors.white),
                        title: Text(
                          controller.screens[selectedScreenIndex]["title"]
                              .toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      )
                    : isProductPage
                        ? AppBar(
                            flexibleSpace: Container(
                              decoration: const BoxDecoration(
                                gradient: AppConstants.customGradient,
                              ),
                            ),
                            bottom: TabBar(
                              controller: productcontroller.tabController,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white,
                              indicatorColor: Colors.green,
                              indicatorWeight: 4,
                              tabs: [
                                Tab(text: 'Approved'),
                                Tab(text: 'Pending'),
                                Tab(text: 'Cancel'),
                                Tab(text: 'Draft'),
                              ],
                              labelStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                height: 1.7,
                              ),
                            ),
                            centerTitle: true,
                            automaticallyImplyLeading: true,
                            iconTheme: const IconThemeData(color: Colors.white),
                            title: Text(
                              controller.screens[selectedScreenIndex]["title"]
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          )
                        : AppBar(
                            flexibleSpace: Container(
                              decoration: const BoxDecoration(
                                gradient: AppConstants.customGradient,
                              ),
                            ),
                            centerTitle: true,
                            automaticallyImplyLeading: true,
                            iconTheme: const IconThemeData(color: Colors.white),
                            title: Text(
                              controller.screens[selectedScreenIndex]["title"]
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ),
            drawer: Appbardrawer(),
            body: controller.screens[selectedScreenIndex]["screen"],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black45,
              currentIndex: selectedScreenIndex,
              onTap: (index) {
                controller.selectScreen(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.inventory_2_outlined), label: 'Orders'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer_outlined), label: 'Listing'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assignment), label: 'Inventory'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ),
        ),
      );
    });
  }
}
