import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:bhk_seller_app/data/response/status.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/salesgraph.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/collection.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/product.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/shop_category.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/brand.dart';
import 'package:bhk_seller_app/screens/dashboardManagement/trendingproduct.dart';
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
                    Collections(),
                    Container(
                      color: const Color.fromARGB(195, 247, 243, 233),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShopCarousel(),
                          const SizedBox(height: 11),
                          Brand(),
                          const SizedBox(height: 10),
                          controller.getTrendingProductModel.value.data?.docs
                                      ?.isNotEmpty ??
                                  true
                              ? TrendingProduct()
                              : SizedBox(),
                          const SizedBox(height: 20),
                          Salesgraph(),
                          const SizedBox(height: 10),
                          controller.getProductModel.value.data?.docs
                                      ?.isNotEmpty ??
                                  true
                              ? ProductSaleScreen()
                              : SizedBox(),
                        ],
                      ),
                    ),
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
