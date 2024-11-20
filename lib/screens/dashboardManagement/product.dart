import 'package:bhk_seller_app/controller/commondashcontroller.dart';
import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSaleScreen extends StatelessWidget {
  const ProductSaleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    CommonDashController dashController = Get.put(CommonDashController());
    return Obx(
      () => Container(
        color: const Color.fromARGB(
            195, 247, 243, 233), // Background color below the Shop By Category
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Added Products',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      dashController.selectedScreenIndex.value = 1;
                    },
                    child: Text(
                      'View All>',
                      style: TextStyle(fontSize: 14.0, color: Colors.brown),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: (controller
                                .getProductModel.value.data?.docs?.length ??
                            0) >=
                        4
                    ? 4
                    : (controller.getProductModel.value.data?.docs?.length ??
                        0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(RoutesClass.gotoProductDetailScreen(),
                          arguments: {
                            "productid": controller.getProductModel.value.data
                                    ?.docs?[index].productId ??
                                0
                          });
                    },
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(
                                    RoutesClass.gotoProductDetailScreen(),
                                    arguments: {
                                      "productid": controller
                                              .getProductModel
                                              .value
                                              .data
                                              ?.docs?[index]
                                              .productId ??
                                          0
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                width: 160,
                                height: 170,
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade100,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
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
                                                      ?.rearView ??
                                                  "",
                                            ),
                                            fit: BoxFit
                                                .contain, // Use BoxFit.cover here for fitting the image
                                          ),
                                          // Add a background color as fallback
                                        ),
                                        child: controller
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
                                                    ?.rearView ==
                                                null
                                            ? Center(
                                                child: Text(
                                                  "No Image data Found",
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            : null,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.getProductModel.value.data
                                      ?.docs?[index].productName ??
                                  "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller
                                          .getProductModel
                                          .value
                                          .data
                                          ?.docs?[index]
                                          .category
                                          ?.categoryName ??
                                      "",
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "(${controller.getProductModel.value.data?.docs?[index].brand?.brandName ?? ""})",
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisSize: MainAxisSize.min,
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
                                          .sellingPrice ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 6),
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
                                          .mrp ??
                                      "",
                                  style: const TextStyle(
                                    color: Color.fromARGB(198, 143, 142, 142),
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '(${controller.getProductModel.value.data?.docs?[index].variants?[(controller.getProductModel.value.data?.docs?[index].variants?.length ?? 0) - 1].discount ?? ""})',
                                  style: const TextStyle(
                                    color: Color.fromARGB(198, 143, 142, 142),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
