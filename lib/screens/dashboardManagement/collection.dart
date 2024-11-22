import 'package:bhk_seller_app/controller/dashboardcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    Dashboardcontroller controller = Get.put(Dashboardcontroller());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: const Color.fromARGB(
          195, 247, 243, 233), // Background color below the Shop By Category

      width: w,
      height: h * 0.16,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(12.0),
              width: w * 0.45, // Adjust width as needed
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100], // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for icon and title
                  Row(
                    children: [
                      // Circular Icon
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.orange
                            .withOpacity(0.2), // Light icon background
                        child: Icon(Icons.shopping_cart,
                            color: Colors.orange, size: 16),
                      ),
                      const SizedBox(width: 8),
                      // Title
                      Text(
                        "Today Orders",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Amount
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                    child: Text(
                      "${controller.getTodayOrdersModel.value.data?.totalCount ?? "0"}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 12, 12, 12),
              width: w * 0.45,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100], // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for icon and title
                  Row(
                    children: [
                      // Circular Icon
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue
                            .withOpacity(0.2), // Light icon background
                        child:
                            Icon(Icons.bar_chart, color: Colors.blue, size: 16),
                      ),
                      const SizedBox(width: 8),
                      // Title
                      Text(
                        "Today Sales",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Amount
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                    child: Text(
                      '₹ 100',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 12, 12, 12),
              width: w * 0.45,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[100], // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for icon and title
                  Row(
                    children: [
                      // Circular Icon
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red
                            .withOpacity(0.2), // Light icon background
                        child: Icon(Icons.pending_actions,
                            color: Colors.red, size: 16),
                      ),
                      const SizedBox(width: 8),
                      // Title
                      Text(
                        "Pending Orders",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Amount
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                    child: Text(
                      "12",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12.0),
              width: w * 0.45, // Adjust width as needed
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100], // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for icon and title
                  Row(
                    children: [
                      // Circular Icon
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.orange
                            .withOpacity(0.2), // Light icon background
                        child: Icon(Icons.shopping_cart,
                            color: Colors.orange, size: 16),
                      ),
                      const SizedBox(width: 8),
                      // Title
                      Text(
                        "Total Orders",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Amount
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                    child: Text(
                      "20",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 12, 12, 12),
              width: w * 0.45,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100], // Background color
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for icon and title
                  Row(
                    children: [
                      // Circular Icon
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue
                            .withOpacity(0.2), // Light icon background
                        child:
                            Icon(Icons.bar_chart, color: Colors.blue, size: 16),
                      ),
                      const SizedBox(width: 8),
                      // Title
                      Text(
                        "Annual Sales",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Amount
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                    child: Text(
                      "₹ ${controller.getSalesModel.value.data?.totalSales ?? "0"}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.fromLTRB(0, 12, 12, 12),
            //   width: w * 0.45,
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     color: Colors.red[100], // Background color
            //     borderRadius: BorderRadius.circular(12), // Rounded corners
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.1),
            //         blurRadius: 5,
            //         offset: const Offset(0, 3), // Shadow position
            //       ),
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Row for icon and title
            //       Row(
            //         children: [
            //           // Circular Icon
            //           CircleAvatar(
            //             radius: 12,
            //             backgroundColor: Colors.red
            //                 .withOpacity(0.2), // Light icon background
            //             child: Icon(Icons.check_circle,
            //                 color: Colors.red, size: 16),
            //           ),
            //           const SizedBox(width: 8),
            //           // Title
            //           Text(
            //             "Processed",
            //             style: const TextStyle(
            //               fontSize: 13,
            //               fontWeight: FontWeight.w600,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ],
            //       ),
            //       const SizedBox(height: 16),
            //       // Amount
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
            //         child: Text(
            //           "12",
            //           style: const TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 24,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
