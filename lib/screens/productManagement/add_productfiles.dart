import 'dart:io';

import 'package:bhk_seller_app/common/CommonMethods.dart';
import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/addproductmediacontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductfiles extends StatelessWidget {
  const AddProductfiles({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductMediaController controller = Get.put(AddProductMediaController());
    return Obx(() => Stack(children: [
          Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppConstants.customGradient,
                  ),
                ),
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.white),
                // automaticallyImplyLeading: false,
                title: Text(
                  controller.producteditId == true
                      ? "Edit Product".toUpperCase()
                      : "Add Product".toUpperCase(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              body: Obx(() => Container(
                    color: const Color.fromARGB(195, 247, 243, 233),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title Row
                            controller.producteditId == true
                                ? const Row(
                                    children: [
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.edit,
                                        size: 20.0,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        'Edit Product',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                : const Row(
                                    children: [
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.shopping_cart,
                                        size: 20.0,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(width: 10.0),
                                      Text(
                                        'Add Product',
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                            SizedBox(height: 5.0),

                            // Subtitle
                            controller.producteditId == true
                                ? const Text(
                                    'Edit and manage your product.',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: Color.fromARGB(255, 140, 136, 136),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Text(
                                    'Add a new product to your store.',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: Color.fromARGB(255, 140, 136, 136),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            SizedBox(height: 25.0),

                            // Step Indicator
                            Row(
                              children: [
                                controller.buildStepCircle(
                                    "General", 01, false, true),
                                controller.buildStepDivider(),
                                controller.buildStepCircle(
                                    "Details", 02, false, true),
                                controller.buildStepDivider(),
                                controller.buildStepCircle(
                                    "Files", 03, true, false),
                                controller.buildStepDivider(),
                                controller.buildStepCircle(
                                    "Review", 04, false, false),
                              ],
                            ),
                            SizedBox(height: 16.0),

                            // Image Picker Box
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Upload Images",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " *",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              width: double.infinity,
                              height: 150.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.cloud_upload,
                                      size: 50, color: Colors.grey),
                                  const SizedBox(height: 8.0),
                                  const Text("Upload your images here"),
                                  const SizedBox(height: 4.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.openImages(context);
                                    },
                                    child: const Text(
                                      'Click to browse',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8.0),

                            // Instructions for Image upload
                            Text(
                              "Add up to 4 images and 1 Video to your product. Used to represent your product during checkout, in email, social sharing, and more.",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              controller.errormessage.value,
                              style: TextStyle(color: Colors.red),
                            ),
                            SizedBox(height: 60.0),
                            controller.producteditId == true
                                ? Text("Your Product Images:")
                                : Text("Picked Files:"),
                            Divider(),
                            controller.producteditId == true
                                ? controller.imagefiles.isNotEmpty
                                    ? controller.imagefiles.isNotEmpty
                                        ? Container(
                                            height: 200,
                                            child: GridView.count(
                                                // physics:
                                                //     NeverScrollableScrollPhysics(),
                                                crossAxisCount: 3,
                                                // scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                mainAxisSpacing: 20,
                                                // crossAxisSpacing: 20,
                                                // childAspectRatio: 1,
                                                //  mainAxisExtent: 390
                                                children: List.generate(
                                                    growable: false,
                                                    controller.imagefiles.length,
                                                    (index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: 250,
                                                      child: Column(
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .imagefiles
                                                                    .removeAt(
                                                                        index);

                                                                if (controller
                                                                        .count >
                                                                    0) {
                                                                  controller
                                                                      .count--;
                                                                }
                                                              },
                                                              child: Icon(
                                                                  Icons.close)),
                                                          Image.file(
                                                            File(controller
                                                                .imagefiles[
                                                                    index]
                                                                .path),
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .25,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .09,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                  /*return Container(
                                          child: Card(
                                        child: Container(
                                          // height: 100,
                                          // width: 100,
                                          child: Image.file(
                                            File(imagefiles![index].path),
                                            // scale: 1.0,
                                          ),
                                        ),
                                      ));*/
                                                })))
                                        : Container()
                                    : Container(
                                        height: 200,
                                        child: GridView.count(
                                            // physics:
                                            //     NeverScrollableScrollPhysics(),
                                            crossAxisCount: 3,
                                            // scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            mainAxisSpacing: 20,
                                            // crossAxisSpacing: 20,
                                            // childAspectRatio: 1,
                                            //  mainAxisExtent: 390
                                            children: List.generate(
                                                growable: false,
                                                controller
                                                        .getProductDetailsModel
                                                        .value
                                                        .data
                                                        ?.variants?[(controller
                                                                    .getProductDetailsModel
                                                                    .value
                                                                    .data
                                                                    ?.variants
                                                                    ?.length ??
                                                                0) -
                                                            1]
                                                        .media
                                                        ?.images
                                                        ?.length ??
                                                    0, (index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 250,
                                                  child: Column(
                                                    children: [
                                                      Image.network(
                                                        controller
                                                                .getProductDetailsModel
                                                                .value
                                                                .data
                                                                ?.variants?[(controller
                                                                            .getProductDetailsModel
                                                                            .value
                                                                            .data
                                                                            ?.variants
                                                                            ?.length ??
                                                                        0) -
                                                                    1]
                                                                .media
                                                                ?.images?[index] ??
                                                            "",
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .25,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .09,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })))
                                : controller.imagefiles.isNotEmpty
                                    ? Container(
                                        height: 200,
                                        child: GridView.count(
                                            // physics:
                                            //     NeverScrollableScrollPhysics(),
                                            crossAxisCount: 3,
                                            // scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            mainAxisSpacing: 20,
                                            // crossAxisSpacing: 20,
                                            // childAspectRatio: 1,
                                            //  mainAxisExtent: 390
                                            children: List.generate(
                                                growable: false,
                                                controller.imagefiles.length,
                                                (index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: 250,
                                                  child: Column(
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            controller
                                                                .imagefiles
                                                                .removeAt(
                                                                    index);

                                                            if (controller
                                                                    .count >
                                                                0) {
                                                              controller
                                                                  .count--;
                                                            }
                                                          },
                                                          child: Icon(
                                                              Icons.close)),
                                                      Image.file(
                                                        File(controller
                                                            .imagefiles[index]
                                                            .path),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .25,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .09,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                              /*return Container(
                                          child: Card(
                                        child: Container(
                                          // height: 100,
                                          // width: 100,
                                          child: Image.file(
                                            File(imagefiles![index].path),
                                            // scale: 1.0,
                                          ),
                                        ),
                                      ));*/
                                            })))
                                    : Container(),
                            controller.imagefiles.isNotEmpty
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : controller.producteditId == true
                                    ? const SizedBox(height: 10)
                                    : const SizedBox(
                                        height: 200,
                                      ),

                            // Save as Draft and Next Step Buttons
                            ElevatedButton(
                              onPressed: () {
                                if (controller.producteditId == true) {
                                  if (controller.mediaimage == true) {
                                    if (controller.imagefiles.length != 4) {
                                      print(controller.imagefiles.length);
                                      controller.errormessage.value =
                                          "*Required Field! Please Upload the Images";
                                    } else if (controller.imagefiles.length ==
                                        4) {
                                      controller.errormessage.value = "";
                                      controller.addProductMediaApi(context);
                                    }
                                  } else {
                                    Get.offAllNamed(
                                        RoutesClass.gotoProductScreen());
                                  }
                                } else {
                                  if (controller.imagefiles.length != 4) {
                                    print(controller.imagefiles.length);
                                    controller.errormessage.value =
                                        "*Required Field! Please Upload the Images";

                                    CommonMethods.showToast(
                                        "Please Upload Images");
                                  } else {
                                    controller.errormessage.value = "";
                                    controller.addProductMediaApi(context);
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF5D2E17),
                                minimumSize: Size(double.infinity, 50),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))),
          progressBarTransparent(
            controller.rxRequestStatus.value == Status.LOADING,
            MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.width,
          ),
        ]));
  }
}
