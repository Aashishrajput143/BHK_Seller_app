import 'dart:convert';
import 'package:bhk_seller_app/screens/ordersManagement/orders_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/constants.dart';

class OrdersDetails extends StatefulWidget {
  final List object;
  const OrdersDetails({Key? key, required this.object}) : super(key: key);

  @override
  State<OrdersDetails> createState() => _OrdersDetailsState();
}

class _OrdersDetailsState extends State<OrdersDetails> {
  // @override
  // initState() {
  //   getDetails(context, '');
  //   // }
  // }
  String smallSentence(String bigSentence) {
    if (bigSentence.length > 25) {
      return bigSentence.substring(0, 25) + '.....';
    } else {
      return bigSentence;
    }
  }

  List orderList = [];
  /*Future getDetails(BuildContext context, String status, int order_id,
      String product_name, String user_name) async {
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    print(status);
    print(order_id);
    print(product_name);
    print(user_name);
    final response = await http.post(
        Uri.parse('${Constant.KEY_URL}/api/update-seller-Order-status'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $login_token',
        },
        body: jsonEncode({
          "status": status,
          "order_id": order_id,
          "product_name": product_name,
          "user_name": user_name
        }));

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var res = jsonDecode(response.body);
      var resp = res["response"];
      var message = resp["message"];
      // var product = message["products"];
      // print(product);
      print(message);
      // setState(() {
      //   orderList = message;
      //   print(orderList);
      // });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrdersList()),
      );

      // ntfile.writeAsStringSync(json.encode(message),
      //     flush: true, encoding: utf8, mode: FileMode.write);
    } else if (response.statusCode > 200) {
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print(data);
      print(message1);
      var code = rest["code"];
      print(data);
      print(code);
      print(message1);
      if (code == 401) {
        //  // prefManager.clear();

        prefManager.remove(Constant.KEY_LOGIN_TOKEN);
        prefManager.remove(Constant.KEY_IS_LOGIN);
        prefManager.remove(Constant.KEY_AVATAR_URL);
        prefManager.remove(Constant.KEY_USER_GROUP);
        prefManager.remove(Constant.KEY_USER_ID);
        Fluttertoast.showToast(
          msg: "$message1",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => DashBoard()),
        //     (route) => false);
      } else {
        Fluttertoast.showToast(
          msg: "$message1",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[400],
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Something went wrong please try again.",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw Exception('Failed to create album.');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    print(widget.object);
    print(widget.object[0]["cart_items"].length);
    return Container(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Order Details".toUpperCase(),
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border(top: BorderSide(color: Colors.grey, width: 5)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Shipping To:".toUpperCase(),
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            new Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.object[0]["users"]["name"]}".toUpperCase(),
                      style: TextStyle(
                          // color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.object[0]["users"]["email"]}".toUpperCase(),
                      style: TextStyle(
                          // color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.object[0]["address"]["address1"]}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          // InkWell(
                          //     onTap: () {
                          //       deleteaddress(
                          //           context,
                          //           object[0]["address"][0]
                          //               ["address_id"]);
                          //     },
                          //     child: Text(
                          //       "Delete",
                          //       style: TextStyle(
                          //           color: Colors.red, fontSize: 16),
                          //     ))
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "${widget.object[0]["address"]["address2"]}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "${widget.object[0]["address"]["city"]},${widget.object[0]["address"]["pin"]},${widget.object[0]["address"]["state"]},${widget.object[0]["address"]["country"]}",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
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
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Products:".toUpperCase(),
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.object[0]["cart_items"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
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
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(widget.object[0]
                                                    ["cart_items"][index]
                                                ["image_url"]),
                                            fit: BoxFit.fill)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      Text(
                                        "   ${smallSentence(widget.object[0]["cart_items"][index]["product_name"])}"
                                            .toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),

                                      Text(
                                        "    ₹${widget.object[0]["cart_items"][index]["price"].toString()}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(
                                      //   "    Status : ${object[index]["status"] ? "Active" : "Inactive"}",
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
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

                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Order Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Total Price :₹${widget.object[0]["total"].toString()}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Payment Status :${widget.object[0]["payment_status"] == null ? "Not Paid" : "Paid"}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "Payment Method :${widget.object[0]["payment_method"] == 'COD' ? "Pay On Delivery" : "Online"}",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: ElevatedButton(
                        onPressed: () {
                          /*getDetails(
                              context,
                              "DISPATCHED",
                              widget.object[0]["order_id"],
                              widget.object[0]["cart_items"][0]["product_name"],
                              widget.object[0]["users"]["name"]);
                          print('Accepted');*/
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text(
                          'Accept Order',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: ElevatedButton(
                        onPressed: () {
                          /*getDetails(
                              context,
                              "COMPLETED",
                              widget.object[0]["order_id"],
                              widget.object[0]["cart_items"][0]["product_name"],
                              widget.object[0]["users"]["name"]);*/
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          'Complete',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            )

            // )
          ]))),
    ));
  }
}
