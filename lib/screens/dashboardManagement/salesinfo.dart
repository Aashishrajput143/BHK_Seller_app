import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Salesinfo extends StatelessWidget {
  const Salesinfo({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Dashboardcontroller();
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: controller.buildDashboardCard(
                    color: const Color.fromARGB(255, 229, 107, 250),
                    icon: Icons.bar_chart,
                    amount:
                        '₹ ${controller.getTotalSalesModel.value.data?.totalSales.toString() ?? "0"}',
                    label: 'Today Sales',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: controller.buildDashboardCard(
                    color: const Color.fromARGB(255, 250, 110, 156),
                    icon: Icons.pending_actions,
                    amount: '25',
                    label: 'Pending Order',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: controller.buildDashboardCard(
                    color: const Color.fromARGB(255, 100, 206, 255),
                    icon: Icons.inventory,
                    amount: '501',
                    label: 'Stock Available',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: controller.buildDashboardCard(
                    color: const Color.fromARGB(255, 250, 185, 101),
                    icon: Icons.shopping_bag,
                    amount: controller
                            .getTodayOrdersModel.value.data?.totalCount
                            .toString() ??
                        "0",
                    label: 'Today Order',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
