import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/chart.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/product.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/salesinfo.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/shop_category.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/brand.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return Obx(() => Stack(children: [
          Scaffold(
            body: RefreshIndicator(
              color: Colors.brown,
              onRefresh: controller.dashboardRefresh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //       begin: Alignment.topCenter,
                    //       end: Alignment.bottomCenter,
                    //       //
                    //       colors: [
                    //         Color.fromARGB(255, 203, 126, 87),
                    //         Color.fromARGB(255, 166, 109, 81),
                    //       ],
                    //     ),
                    //   ),
                    //   //color: const Color(
                    //   //    0xFF5D2E17), // Brown background color above Shop By Category
                    //   padding: const EdgeInsets.all(16.0),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         padding: const EdgeInsets.symmetric(horizontal: 16),
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(25),
                    //         ),
                    //         child: const Row(
                    //           children: [
                    //             Icon(Icons.search, color: Colors.black54),
                    //             SizedBox(width: 10),
                    //             Expanded(
                    //               child: TextField(
                    //                 decoration: InputDecoration(
                    //                   hintText: 'Looking for something specific?',
                    //                   border: InputBorder.none,
                    //                   fillColor: Color(0xFF5D2E17),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //       const SizedBox(height: 5),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      color: const Color.fromARGB(195, 247, 243,
                          233), // Background color below the Shop By Category
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShopCarousel(),
                          //const BannerCarousel(), //banner.dart
                          //const SizedBox(height: 15),
                          //const DealSaleScreen(),
                          const SizedBox(height: 11),
                          Brand(), //myBrands
                          const SizedBox(height: 20),
                          Salesinfo(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 8.0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sales History',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'View All>',
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.brown),
                                ),
                                /*Icon(
                          Icons.arrow_right,
                          size: 30.0,
                        ),*/
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 300,
                            child: Charts(),
                          ),
                          //const FilterButtons(), //filter_buttons.dart
                          //const SizedBox(height: 10),
                          //const ProductSaleScreen(),
                        ],
                      ),
                    ),
                    /*Container(
              width: double.infinity,
              height: 100, // Adjust as per your requirement
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              color: const Color.fromARGB(
                  212, 93, 46, 23), // Brown background for the entire banner
              child: Row(
                children: [
                  // Left-side image
                  Container(
                    width: 170, // Adjust this width as needed
                    height:
                        120, // Make sure it's a square or suitable height for your image
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage(AppImages.bhkbackground), // Your image
                        fit: BoxFit.cover,
                        opacity: 0.7,
                      ),
                    ),
                  ),

                  // Right-side content
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      color: Colors
                          .transparent, // No specific background color for the right content
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text at the top
                          Text(
                            'SABSE LOWEST PRICES',
                            style: TextStyle(
                              color: Colors.white, // White color for the text
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                              height: 8), // Space between the two text lines
                          Text(
                            'LIVE NOW',
                            style: TextStyle(
                              color: Colors
                                  .white, // White color to match the banner's background
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),

                  // Button at the far right
                  ElevatedButton(
                    onPressed: () {
                      // Button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 177, 87, 59), // Darker brown for the button
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'SHOP NOW',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),*/
                    controller.getProductModel.value.data?.docs?.isNotEmpty ??
                            true
                        ? ProductSaleScreen()
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ]));
  }
}
