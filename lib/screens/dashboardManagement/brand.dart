import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());

    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Brands',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //DealTimer(endTime: endTime), //end_deal.dart
              ],
            ),
            SizedBox(
              height: 90, // Give a fixed height
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Enable horizontal scrolling
                itemCount:
                    controller.getBrandModel.value.data?.docs?.length ?? 0,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          RoutesClass.gotoBrandDetailsScreen(),
                          arguments: {
                            'brandid': controller.getBrandModel.value.data
                                    ?.docs?[index].brandId ??
                                "",
                          },
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Container(
                          width: 120,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          child: Image.network(
                            controller.getBrandModel.value.data?.docs?[index]
                                    .brandLogo ??
                                "",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
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
