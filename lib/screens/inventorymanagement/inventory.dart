import 'package:bhk_seller_app/controller/inventoryscreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    InventoryController controller = Get.put(InventoryController());
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Center(child: Text("No Sales Found")),
                Center(child: Text("No Stock Found")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}