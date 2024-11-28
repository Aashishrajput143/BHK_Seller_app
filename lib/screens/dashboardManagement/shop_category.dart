import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopCategory extends StatelessWidget {
  const ShopCategory({super.key});

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
                        controller.getCategoryModel.value.data?.docs?[index]
                                    .categoryLogo?.isNotEmpty ??
                                true
                            ? CircleAvatar(
                                backgroundColor: Colors.brown.shade100,
                                radius: 35,
                                child: ClipOval(
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        0.0), // Padding inside the CircleAvatar
                                    child: Image.network(
                                      width: 70,
                                      height: 70,
                                      controller.getCategoryModel.value.data
                                              ?.docs?[index].categoryLogo ??
                                          "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.brown.shade100,
                                radius: 35,
                                child: ClipOval(
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        10.0), // Padding inside the CircleAvatar
                                    child: Image.asset(
                                      AppImages.product3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
