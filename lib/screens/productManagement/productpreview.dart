import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/productpreviewcontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPreview extends StatelessWidget {
  const ProductPreview({super.key});

  @override
  Widget build(BuildContext context) {
    ProductPreviewController controller = Get.put(ProductPreviewController());
    return Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppConstants.customGradient,
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(RoutesClass.gotoaddProductScreen(),
                          arguments: {
                            "productid": controller.getProductDetailsModel.value
                                    .data?.productId ??
                                0,
                            "producteditid": true,
                          });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Edit',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 15)
                      ],
                    ),
                  ),
                  SizedBox(width: 10)
                ],
                iconTheme: const IconThemeData(color: Colors.white),
                centerTitle: true,
                title: Text(
                  "Product Details".toUpperCase(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: controller
                              .getProductDetailsModel
                              .value
                              .data
                              ?.variants?[(controller.getProductDetailsModel
                                          .value.data?.variants?.length ??
                                      0) -
                                  1]
                              .media
                              ?.images
                              ?.map((item) => SizedBox(
                                    width: double.infinity,
                                    height:
                                        430.0, // Adjust height as per your design
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: ClipRRect(
                                        child: Container(
                                          decoration: const BoxDecoration(),
                                          height:
                                              430, // Adjust height as per your design
                                          child: Row(
                                            children: [
                                              // Image on the Left Side
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    3, // Adjust width as needed
                                                height: double
                                                    .infinity, // Fill the entire height of the container
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        item), // Image asset
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList() ??
                          [],
                      carouselController: controller.slidercontroller,
                      options: CarouselOptions(
                        height: 430,
                        enlargeCenterPage: true,
                        viewportFraction: 1.035,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          controller.currentIndex.value = index;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller
                              .getProductDetailsModel
                              .value
                              .data
                              ?.variants?[(controller.getProductDetailsModel
                                          .value.data?.variants?.length ??
                                      0) -
                                  1]
                              .media
                              ?.images
                              ?.asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () => controller.slidercontroller
                                  .animateToPage(entry.key),
                              child: Container(
                                width: 20.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          controller.currentIndex == entry.key
                                              ? 0.9
                                              : 0.4),
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          // Product Name, Price and Quantity
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.getProductDetailsModel.value.data
                                          ?.productName ??
                                      "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                        '₹ ${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].sellingPrice ?? ""}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 8),
                                    Text(
                                        '₹ ${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].mrp ?? ""}',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough)),
                                    SizedBox(width: 8),
                                    Text(
                                        '${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].discount ?? ""}% OFF',
                                        style: TextStyle(color: Colors.green)),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text('Quantity : ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 10),
                                    Text(
                                      '₹ ${controller.getProductDetailsModel.value.data?.variants?[(controller.getProductDetailsModel.value.data?.variants?.length ?? 0) - 1].quantity ?? ""} Units',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          // Product Description
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Description',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      controller.getProductDetailsModel.value
                                              .data?.description ??
                                          "Not Available",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product Details',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                controller.productDetailRow(
                                    'Material',
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
                                            .material ??
                                        "Not Available"),
                                controller.productDetailRow(
                                    'Colour',
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
                                            .color ??
                                        "Not Available"),
                                controller.productDetailRow(
                                    'Size',
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
                                            .size ??
                                        "Not Available"),

                                controller.productDetailRow(
                                    'Dimensions',
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
                                            .productDimensions ??
                                        "Not Available"),
                                controller.productDetailRow(
                                    'Product Weight',
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
                                            .weight ??
                                        "Not Available"),
                                //SizedBox(height: 10),
                                // Text(
                                //   'Features',
                                //   style: TextStyle(
                                //       fontSize: 16, fontWeight: FontWeight.bold),
                                // ),
                                // SizedBox(height: 10),
                                // Text(
                                //     'Environmental Brass Alloy With Top Quality Genuine Plating, World-Class Craftsmanship, TSB Collection Makes People Remember Not Only The Jewellery Itself, But Also The Woman.'),
                                // SizedBox(height: 10),
                                // Text(
                                //   'Care Instruction',
                                //   style: TextStyle(
                                //       fontSize: 16, fontWeight: FontWeight.bold),
                                // ),
                                // SizedBox(height: 10),
                                // Text(
                                //     'Keep Away From Water Perfume And Other Chemicals And Clean It With Dry And Soft Cloth.'),

                                // Divider(),
                                // Text(
                                //   'Explore More Variants',
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                // ),
                                // const SizedBox(height: 15),
                                // GridView.builder(
                                //   shrinkWrap: true,
                                //   physics: const NeverScrollableScrollPhysics(),
                                //   gridDelegate:
                                //       const SliverGridDelegateWithFixedCrossAxisCount(
                                //     crossAxisCount: 2,
                                //     childAspectRatio: 3 / 4,
                                //     crossAxisSpacing: 10,
                                //     mainAxisSpacing: 5,
                                //   ),
                                //   itemCount: controller.variantsItem.length,
                                //   itemBuilder: (context, index) {
                                //     return Column(
                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                //       children: [
                                //         InkWell(
                                //           onTap: () {
                                //             // Navigate to category page
                                //           },
                                //           child: Container(
                                //             width: 170,
                                //             height: 150,
                                //             decoration: BoxDecoration(
                                //               image: DecorationImage(
                                //                 image: AssetImage(
                                //                     controller.variantsItem[index]
                                //                         ['imagePath']),
                                //                 fit: BoxFit.cover,
                                //               ),
                                //             ),
                                //             child: Align(
                                //               alignment: Alignment.bottomCenter,
                                //               child: Container(
                                //                 padding: const EdgeInsets.all(8),
                                //                 decoration: const BoxDecoration(
                                //                     //color: Colors.black54,
                                //                     ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //         const SizedBox(height: 10),
                                //         Text(
                                //           controller.variantsItem[index]['title'],
                                //           style: const TextStyle(
                                //             color: Colors.black,
                                //             fontWeight: FontWeight.bold,
                                //             fontSize: 12,
                                //           ),
                                //           textAlign: TextAlign.start,
                                //         ),
                                //         const SizedBox(height: 6),
                                //         Row(
                                //           mainAxisSize: MainAxisSize.min,
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.center,
                                //           children: [
                                //             Text(
                                //               "${controller.variantsItem[index]['finalprice']}",
                                //               style: const TextStyle(
                                //                 color: Colors.black,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontSize: 15,
                                //               ),
                                //               textAlign: TextAlign.start,
                                //             ),
                                //             const SizedBox(width: 6),
                                //             Text(
                                //               "${controller.variantsItem[index]['price']}",
                                //               style: const TextStyle(
                                //                 color: Color.fromARGB(
                                //                     198, 143, 142, 142),
                                //                 fontSize: 10,
                                //                 decoration:
                                //                     TextDecoration.lineThrough,
                                //               ),
                                //               textAlign: TextAlign.start,
                                //             ),
                                //             const SizedBox(width: 6),
                                //             Text(
                                //               '(${controller.variantsItem[index]['discount']})',
                                //               style: const TextStyle(
                                //                 color: Color.fromARGB(
                                //                     198, 143, 142, 142),
                                //                 fontSize: 10,
                                //               ),
                                //               textAlign: TextAlign.start,
                                //             ),
                                //           ],
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // ),
                                // Add your custom 'People Also Viewed' section here
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            progressBarTransparent(
              controller.rxRequestStatus.value == Status.LOADING,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width,
            ),
          ],
        ));
  }
}
