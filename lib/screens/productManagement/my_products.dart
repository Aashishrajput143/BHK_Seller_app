import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/getproductcontroller.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';

class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    GetProductController controller = Get.put(GetProductController());
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            backgroundColor: const Color.fromARGB(195, 247, 243, 233),
            body: RefreshIndicator(
              color: Colors.brown,
              onRefresh: controller.productRefresh,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    color: const Color.fromARGB(195, 247, 243, 233),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.getProductModel.value.data?.docs?.isEmpty ??
                                true
                            ? Row()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'My Products',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                          RoutesClass.gotoaddProductScreen(),
                                          arguments: {
                                            "productid": 0,
                                            "producteditid": false
                                          })?.then((onValue) {
                                        controller.getProductApi();
                                      });
                                    },
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center, // Center the content
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.brown,
                                          size: 22.0,
                                        ),
                                        SizedBox(
                                            width:
                                                2), // Space between icon and text
                                        Text(
                                          'Add Product',
                                          style: TextStyle(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.getProductModel.value.data?.docs?.isEmpty ??
                              true
                          ? Column(
                              children: [
                                // Empty state content
                                Text(
                                  "Hi, there.",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                  ),
                                ),
                                SizedBox(height: 100),
                                Image.asset(
                                  AppImages.myproductcart,
                                  height: 250,
                                  width: 220,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(height: 70),
                                Text(
                                  'Add Your Products',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[900],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    "Thanks for checking out Products, we hope your products can "
                                    "make your routine a little more enjoyable.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 40),
                              ],
                            )
                          : Container(
                              color: const Color.fromARGB(195, 247, 243, 233),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.76,
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller.getProductModel.value
                                          .data?.docs?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                              RoutesClass
                                                  .gotoProductDetailScreen(),
                                              arguments: {
                                                "productid": controller
                                                        .getProductModel
                                                        .value
                                                        .data
                                                        ?.docs?[index]
                                                        .productId ??
                                                    0
                                              })?.then((onValue) {
                                            controller.getProductApi();
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            border: Border.all(
                                              color: Colors.grey
                                                  .shade300, // Border color
                                              width: 1.0, // Border width
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .shade300, // Shadow color
                                                blurRadius:
                                                    6, // Blur radius for the shadow
                                                offset: Offset(0,
                                                    4), // Offset for shadow position
                                              ),
                                            ], // Match the card's border radius
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                12.0), // Slightly reduced padding
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    // Product Image
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      child: Container(
                                                        color: Colors.grey
                                                            .shade200, // Set your desired background color here
                                                        child: Image.network(
                                                          controller
                                                                  .getProductModel
                                                                  .value
                                                                  .data
                                                                  ?.docs?[index]
                                                                  .variants?[(controller
                                                                              .getProductModel
                                                                              .value
                                                                              .data
                                                                              ?.docs?[index]
                                                                              .variants
                                                                              ?.length ??
                                                                          0) -
                                                                      1]
                                                                  .media
                                                                  ?.images
                                                                  ?.frontView ??
                                                              "",
                                                          height:
                                                              60, // Adjusted size to match the design
                                                          width: 60,
                                                          fit: BoxFit.fill,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              width: 60,
                                                              height: 60,
                                                              color: Colors.grey
                                                                  .shade300,
                                                              child: Center(
                                                                child: Text(
                                                                  "No Image",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                        width:
                                                            16), // Adjusted spacing
                                                    // Product Info
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .getProductModel
                                                                  .value
                                                                  .data
                                                                  ?.docs?[index]
                                                                  .productName ??
                                                              "",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .black87, // Darker text for the product name
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                6), // Slight space adjustment
                                                        Text(
                                                          "₹ ${controller.getProductModel.value.data?.docs?[index].variants?[(controller.getProductModel.value.data?.docs?[index].variants?.length ?? 0) - 1].sellingPrice ?? ""}",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors
                                                                .black54, // Lighter grey for the price
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 16),
                                                // Stock and Last Restock Info
                                                Divider(
                                                    color: Colors.grey.shade300,
                                                    height:
                                                        2), // Light divider for separation
                                                SizedBox(height: 12),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Stock info
                                                    Column(
                                                      children: [
                                                        Text(
                                                          controller
                                                                  .getProductModel
                                                                  .value
                                                                  .data
                                                                  ?.docs?[index]
                                                                  .variants?[(controller
                                                                              .getProductModel
                                                                              .value
                                                                              .data
                                                                              ?.docs?[index]
                                                                              .variants
                                                                              ?.length ??
                                                                          0) -
                                                                      1]
                                                                  .quantity
                                                                  .toString() ??
                                                              "",
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .black87, // Darker text for stock info
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'In Stock',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    // Last Restock info
                                                    Column(
                                                      children: [
                                                        Text(
                                                          (controller
                                                                      .getProductModel
                                                                      .value
                                                                      .data
                                                                      ?.docs?[
                                                                          index]
                                                                      .variants?[
                                                                          (controller.getProductModel.value.data?.docs?[index].variants?.length ?? 0) -
                                                                              1]
                                                                      .quantity ??
                                                                  0 - 50)
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .black87, // Darker text for last restock info
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'Last Restock',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: controller
                        .getProductModel.value.data?.docs?.isEmpty ??
                    true
                ? Container(
                    height: 50,
                    width: 230,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              const Color.fromARGB(255, 118, 60, 31)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                      child: const Text(
                        'Add New Product',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        Get.toNamed(RoutesClass.gotoaddProductScreen(),
                            arguments: {
                              "productid": 0,
                              "producteditid": false
                            })?.then((onValue) {
                          controller.getProductApi();
                        });
                      },
                    ),
                  )
                : Container(),
          ),
          // Progress bar overlay
          progressBarTransparent(
            controller.rxRequestStatus.value == Status.LOADING,
            MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
