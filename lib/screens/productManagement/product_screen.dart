import 'package:bhk_seller_app/controller/productscreencontroller.dart';
import 'package:bhk_seller_app/screens/productManagement/my_products.dart';
import 'package:bhk_seller_app/screens/productManagement/pending_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                MyProducts(),
                PendingProducts(),
                Center(child: Text("No Cancel Products")),
                Center(child: Text("No Products in Draft")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
