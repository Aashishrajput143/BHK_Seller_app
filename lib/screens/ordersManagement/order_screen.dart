import 'package:bhk_seller_app/controller/orderscreencontroller.dart';
import 'package:bhk_seller_app/screens/ordersManagement/orderlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                OrderList(),
                Center(child: Text("No Past Orders")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
