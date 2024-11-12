import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopCarousel extends StatelessWidget {
  const ShopCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 100, // Give a fixed height
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount:
                    controller.getCategoryModel.value.data?.docs?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 13, left: 3),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: controller
                                      .getCategoryModel
                                      .value
                                      .data
                                      ?.docs?[index]
                                      .categoryLogo
                                      ?.isNotEmpty ??
                                  false
                              ? NetworkImage(controller.getCategoryModel.value
                                      .data?.docs?[index].categoryLogo ??
                                  "")
                              : AssetImage(AppImages
                                  .product4), // Default image if logo not found
                          radius: 35,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          controller.getCategoryModel.value.data?.docs?[index]
                                  .categoryName ??
                              "",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
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
