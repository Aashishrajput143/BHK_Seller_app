import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/screens/ordersManagement/orderdetails.dart';
import 'package:flutter/material.dart';
import '../order_details_screen.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  int screen = 1;
  List orderList = [];

  void setscreen(int value) {
    setState(() {
      screen = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color.fromARGB(195, 247, 243, 233),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(children: [
            // Container(
            //   child:
            orderList.isEmpty
                ? screen == 1
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: MyordersDetails(),
                      )
                    : screen == 2
                        ? Column(
                            children: [
                              // Header Text
                              Text(
                                "Hi, there.",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                              SizedBox(height: 100),
                              // Mammoth Image (Use asset image here)
                              Image.asset(
                                AppImages
                                    .orderscreen, // Add your mammoth image to assets
                                height: 250,
                                width: 220,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 70),
                              // Greeting Text
                              Text(
                                "No Sales Available",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              SizedBox(height: 10),
                              // Subtext
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "Thanks for checking out Harry's, we hope our products can "
                                  "make your morning routine a little more enjoyable.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              // Header Text
                              Text(
                                "Hi, there.",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                              SizedBox(height: 100),
                              // Mammoth Image (Use asset image here)
                              Image.asset(
                                AppImages
                                    .orderscreen, // Add your mammoth image to assets
                                height: 250,
                                width: 220,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 70),
                              // Greeting Text
                              Text(
                                "No History Available",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              SizedBox(height: 10),
                              // Subtext
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "Thanks for checking out Harry's, we hope our products can "
                                  "make your morning routine a little more enjoyable.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
                                ),
                              ),
                            ],
                          )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: orderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order#${orderList[index]["order_id"]}",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              InkWell(
                                  onTap: () {
                                    // });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrdersDetails(
                                                object: [orderList[index]],
                                              )),
                                    );
                                  },
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 16),
                                  ))
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Placed On : ${orderList[index]["date"]}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      "Amount : ₹${orderList[index]["total"].toString()}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      "Status : ${orderList[index]["status"]}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 20),
                          Divider(
                            height: 20,
                            thickness: 0.15,
                            endIndent: 0,
                            color: Colors.black,
                          ),
                        ]),
                      );
                    }),
          ]))),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     SizedBox(width: 7),
      //     ElevatedButton(
      //       style: ButtonStyle(
      //           backgroundColor: WidgetStateProperty.all(
      //             screen == 1
      //                 ? const Color.fromARGB(255, 88, 150, 66)
      //                 : const Color.fromARGB(255, 171, 115, 87),
      //           ),
      //           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                   borderRadius:
      //                       // BorderRadius.zero,
      //                       BorderRadius.circular(30)))),
      //       onPressed: () {
      //         setscreen(1);
      //       },
      //       child: Text(
      //         "Orders",
      //         style: TextStyle(
      //             fontSize: 10,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     SizedBox(width: 7),
      //     ElevatedButton(
      //       style: ButtonStyle(
      //           backgroundColor: WidgetStateProperty.all(
      //             screen == 2
      //                 ? const Color.fromARGB(255, 88, 150, 66)
      //                 : const Color.fromARGB(255, 171, 115, 87),
      //           ),
      //           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                   borderRadius:
      //                       // BorderRadius.zero,
      //                       BorderRadius.circular(30)))),
      //       onPressed: () {
      //         setscreen(2);
      //       },
      //       child: Text(
      //         "Sales",
      //         style: TextStyle(
      //             fontSize: 10,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     SizedBox(width: 7),
      //     ElevatedButton(
      //       style: ButtonStyle(
      //           backgroundColor: WidgetStateProperty.all(
      //             screen == 3
      //                 ? const Color.fromARGB(255, 88, 150, 66)
      //                 : const Color.fromARGB(255, 171, 115, 87),
      //           ),
      //           shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                   borderRadius:
      //                       // BorderRadius.zero,
      //                       BorderRadius.circular(30)))),
      //       onPressed: () {
      //         setscreen(3);
      //       },
      //       child: Text(
      //         "History",
      //         style: TextStyle(
      //             fontSize: 10,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     SizedBox(width: 7),
      //   ],
      // ),
    );
  }
}
