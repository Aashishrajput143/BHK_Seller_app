import 'package:bhk_seller_app/controller/ordercontroller.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyordersDetails extends StatelessWidget {
  const MyordersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    GetOrderController controller = Get.put(GetOrderController());
    return Obx(
      () => Container(
        color: const Color.fromARGB(195, 247, 243, 233),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Check if the data is empty
            controller.getorderModel.value.data?.docs?.isEmpty ?? true
                ? Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hi, there.",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                          ),
                        ),
                        const SizedBox(height: 100),
                        Image.asset(
                          AppImages.orderscreen,
                          height: 250,
                          width: 220,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 70),
                        const Text(
                          'No Orders Available',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Thanks for checking out orders, we hope our products can make your morning routine a little more enjoyable.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // 3 columns
                        childAspectRatio:
                            2 / 3, // Control the size of the grid items
                        crossAxisSpacing: 10, // Space between columns
                        mainAxisSpacing: 10, // Space between rows
                      ),
                      itemCount:
                          controller.getorderModel.value.data?.docs?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 200,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // Rounded corners
                              side: BorderSide(
                                color: Colors.grey, // Border color
                                width: 2, // Border width
                              ),
                            ),
                            elevation: 3, // Shadow under the card
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .stretch, // Ensure the image and text stretch
                              children: [
                                // Image container with full width and fit
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                      controller.getorderModel.value.data
                                              ?.docs?[index].brandLogo ??
                                          "",
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          AppImages.orderproductdefault,
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: 100,
                                  height: 40,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 5, right: 5),
                                    child: Text(
                                      controller.getorderModel.value.data
                                              ?.docs?[index].brandName
                                              .toString() ??
                                          "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10), // Space at the bottom
                              ],
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
