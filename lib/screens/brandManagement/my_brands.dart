import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/getbrandcontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBrands extends StatelessWidget {
  const MyBrands({super.key});

  @override
  Widget build(BuildContext context) {
    GetBrandController controller = Get.put(GetBrandController());
    return Obx(() => Stack(children: [
          Scaffold(
              backgroundColor: const Color.fromARGB(255, 247, 243, 233),
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppConstants.customGradient,
                  ),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
                centerTitle: true,
                title: Text(
                  "My Brands".toUpperCase(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              body: RefreshIndicator(
                color: Colors.brown,
                onRefresh: controller.brandRefresh,
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
                          controller.getBrandModel.value.data?.docs
                                      ?.isNotEmpty ??
                                  true
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'My Brands',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          RoutesClass.gotoaddBrandScreen(),
                                        )?.then((onValue) {
                                          controller.getBrandApi();
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
                                            'Add Brand',
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
                                )
                              : Row(),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.getBrandModel.value.data?.docs?.isNotEmpty ??
                                true
                            ? Container(
                                color: const Color.fromARGB(195, 247, 243, 233),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.83,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 0, 16, 16),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    controller:
                                        controller.scrollController.value,
                                    itemCount: controller.brandList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 12,
                                      childAspectRatio:
                                          1.3, // Set ratio to make squares
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Get.toNamed(
                                            RoutesClass
                                                .gotoBrandDetailsScreen(),
                                            arguments: {
                                              'brandid': controller
                                                      .brandList[index]
                                                      .brandId ??
                                                  "",
                                            },
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 16),
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color:
                                                    Colors.grey, // Border color
                                                width: 1, // Border width
                                              ),
                                            ),
                                            child: Image.network(
                                              controller.brandList[index]
                                                      .brandLogo ??
                                                  "",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  // Header Text
                                  Text(
                                    "Hi, there.",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  const SizedBox(height: 100),
                                  // Mammoth Image (Use asset image here)
                                  Image.asset(
                                    AppImages
                                        .firstbrand, // Add your mammoth image to assets
                                    height: 250,
                                    width: 220,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(height: 70),
                                  // Greeting Text
                                  Text(
                                    'Add Your First Brand',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[900],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Subtext
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Text(
                                      "Thanks for Adding Brand, we hope your brands can "
                                      "make our routine a little more enjoyable.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey[700]),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: controller
                          .getBrandModel.value.data?.docs?.isNotEmpty ??
                      true
                  ? Container()
                  : Container(
                      height: 50,
                      width: 230,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      // margin:
                      // EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color.fromARGB(255, 118, 60, 31)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            // BorderRadius.zero,
                                            BorderRadius.circular(30)))),
                        child: const Text(
                          'Add New Brand',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        onPressed: () {
                          Get.toNamed(
                            RoutesClass.gotoaddBrandScreen(),
                          )?.then((onValue) {
                            controller.getBrandApi();
                          });
                        },
                      ))),
          progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.height)
        ]));
  }
}
