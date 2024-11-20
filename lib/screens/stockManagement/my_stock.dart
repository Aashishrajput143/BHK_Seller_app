import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:bhk_seller_app/resources/images.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyStock extends StatelessWidget {
  MyStock({super.key});

  final List<dynamic> object = [];
  String smallSentence(String bigSentence) {
    if (bigSentence.length > 15) {
      return bigSentence.substring(0, 15) + '..';
    } else {
      return bigSentence;
    }
  }

  final TextEditingController _discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: AppConstants.customGradient,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "My Products Stocks".toUpperCase(),
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        body: Container(
            color: const Color.fromARGB(195, 247, 243, 233),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 20,
              ),
              // Container(
              //   child:
              object.isEmpty
                  ? Container(
                      child: Column(
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
                                .firststock, // Add your mammoth image to assets
                            height: 250,
                            width: 220,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(height: 70),
                          // Greeting Text
                          Text(
                            'Add Your Stocks',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          SizedBox(height: 10),
                          // Subtext
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "Thanks for checking out Harry's, we hope our products can "
                              "make your morning routine a little more enjoyable.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: object.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  object[index]["product_images"]
                                                              .length ==
                                                          0
                                                      ? "https://bharat-hastkaushal.s3.ap-south-1.amazonaws.com/watermark.jpg"
                                                      : object[index]
                                                              ["product_images"]
                                                          [0]["url"]
                                                  // "https://bharat-hastkaushal.s3.ap-south-1.amazonaws.com/images%20%281%29.jpg"
                                                  ),
                                              fit: BoxFit.fill)),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // SizedBox(
                                        //   height: 10,
                                        // ),
                                        Text(
                                          "   ${smallSentence(object[index]["product_name"])}"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Text(
                                          " Status :${object[index]["quantity"] < 20 ? "Less Stock" : object[index]["status"] == true ? "In stock" : "Out of stock"} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  object[index]["quantity"] > 20
                                                      ? Colors.green
                                                      : Colors.red),
                                        ),
                                        Text(
                                          " Quantity :${object[index]["quantity"]} ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                    icon: Icon(
                                      Icons.more_vert,
                                      size: 30,
                                    ),
                                    // add icon, by default "3 dot" icon
                                    // icon: Icon(Icons.book)
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child:
                                              Text("Manage or edit products"),
                                        ),
                                        PopupMenuItem<int>(
                                          value: 1,
                                          child: Text("Edit Product Images"),
                                        ),
                                        // PopupMenuItem<int>(
                                        //   value: 2,
                                        //   child: Text("Manage Stock"),
                                        // ),
                                        PopupMenuItem<int>(
                                          value: 2,
                                          child:
                                              Text("Apply For Deal Of the Day"),
                                        )
                                      ];
                                    },
                                    onSelected: (value) {
                                      if (value == 0) {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           EditProduct(
                                        //               [object[index]])),
                                        // );
                                      } else if (value == 1) {
                                      } else if (value == 2) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              width: 300,
                                              height: 300,
                                              child: AlertDialog(
                                                title: Text(
                                                  'Apply For Deal Of the Day',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'Poppins-Bold'),
                                                ),
                                                content: Column(children: [
                                                  Text(
                                                    'Are you sure you want to add the product to the Deal Of the Day',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                  TextFormField(
                                                    keyboardType: TextInputType
                                                        .numberWithOptions(
                                                            decimal: true,
                                                            signed: false),
                                                    validator: (value) {
                                                      if (value == '') {
                                                        return '*Required Field! Please Discount';
                                                      }
                                                      return null;
                                                    },
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                'Enter discount',
                                                            labelText:
                                                                ' Discount(%)',
                                                            suffixText: '%'),
                                                    controller:
                                                        _discountController,
                                                  ),
                                                ]),
                                                actions: [
                                                  ElevatedButton(
                                                    // textColor: Colors.black,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'CANCEL',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    // textColor: Colors.black,
                                                    onPressed: () {
                                                      /*addDODProduct(
                                                        context,
                                                        object[index]
                                                            ["product_id"],
                                                        double.parse(
                                                            _discountController
                                                                .text),
                                                      );*/
                                                      // suspendProduct(
                                                      //     context,
                                                      //     widget.object[
                                                      //             index][
                                                      //         "product_id"]);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'YES',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        // deletecategory(
                                        //     context,
                                        //     categoryList[index]
                                        //         ["category_id"]);
                                      } else if (value == 2) {
                                        print("Logout menu is selected.");
                                      }
                                    }),
                                // InkWell(
                                //     onTap: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 EditProduct(
                                //                     [object[index]])),
                                //       );
                                //     },
                                //     child: Text(
                                //       "Edit",
                                //       style: TextStyle(
                                //           color: Colors.green,
                                //           fontSize: 16),
                                //     ))
                              ],
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
              // Expanded(
              //     child: Align(
              //         alignment: Alignment.bottomCenter,
              //         child: Container(
              //             height: 60,
              //             width: 280,
              //             padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //             // margin:
              //             // EdgeInsets.only(top: 10),
              //             child: ElevatedButton(
              //               style: ButtonStyle(
              //                   backgroundColor: MaterialStateProperty.all(
              //                       Color.fromARGB(255, 204, 157, 118)),
              //                   shape: MaterialStateProperty.all<
              //                           RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius:
              //                               // BorderRadius.zero,
              //                               BorderRadius.circular(30)))),
              //               child: const Text(
              //                 'Add Another Address',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 18),
              //               ),
              //               onPressed: () {},
              //             )))),
              SizedBox(
                height: 20,
              )
            ]))),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
            height: 50,
            width: 230,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            // margin:
            // EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Color.fromARGB(255, 118, 60, 31)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius:
                              // BorderRadius.zero,
                              BorderRadius.circular(30)))),
              child: const Text(
                'Add New Product',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              onPressed: () {
                Get.toNamed(RoutesClass.gotoaddProductScreen());
              },
            )));
  }
}
