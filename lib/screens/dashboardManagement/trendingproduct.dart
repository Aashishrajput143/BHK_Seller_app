import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrendingProduct extends StatelessWidget {
  const TrendingProduct({super.key});
  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            child: Text(
              'Top Trending Products',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.33,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: (controller.getTrendingProductModel.value.data?.docs
                                ?.length ??
                            0) >=
                        8
                    ? 8
                    : (controller
                            .getTrendingProductModel.value.data?.docs?.length ??
                        0),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(RoutesClass.gotoProductDetailScreen(),
                          arguments: {
                            "productid": controller.getTrendingProductModel
                                    .value.data?.docs?[index].productId ??
                                0
                          });
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.33,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                                padding: const EdgeInsets.all(16.0),
                                width: 140,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade100,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            controller
                                                    .getTrendingProductModel
                                                    .value
                                                    .data
                                                    ?.docs?[index]
                                                    .variants?[(controller
                                                                .getTrendingProductModel
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
                                                  .getTrendingProductModel
                                                  .value
                                                  .data
                                                  ?.docs?[index]
                                                  .variants?[(controller
                                                              .getTrendingProductModel
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
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                controller.getTrendingProductModel.value.data
                                        ?.docs?[index].productName ??
                                    "",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "₹ ${controller.getTrendingProductModel.value.data?.docs?[index].variants?[(controller.getTrendingProductModel.value.data?.docs?[index].variants?.length ?? 0) - 1].sellingPrice ?? ""}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "₹ ${controller.getTrendingProductModel.value.data?.docs?[index].variants?[(controller.getTrendingProductModel.value.data?.docs?[index].variants?.length ?? 0) - 1].mrp ?? ""}",
                                    style: const TextStyle(
                                      color: Color.fromARGB(198, 143, 142, 142),
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '(${controller.getTrendingProductModel.value.data?.docs?[index].variants?[(controller.getTrendingProductModel.value.data?.docs?[index].variants?.length ?? 0) - 1].discount ?? ""})',
                                    style: const TextStyle(
                                      color: Color.fromARGB(198, 143, 142, 142),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
