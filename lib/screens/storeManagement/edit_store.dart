import 'dart:convert';
import 'dart:io';

import 'package:bhk_seller_app/screens/storeManagement/my_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Constants/constants.dart';

import 'package:path_provider/path_provider.dart';
import 'package:async/async.dart';

class EditStore extends StatefulWidget {
  final List object;
  EditStore(this.object);
  // const EditBrand({Key? key}) : super(key: key);

  @override
  State<EditStore> createState() => _EditStoreState();
}

class _EditStoreState extends State<EditStore> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController openingTime = TextEditingController();
  final TextEditingController closingTime = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.object[0]["store_name"];
    _address1Controller.text = widget.object[0]["address1"];
    _address2Controller.text = widget.object[0]["address2"];
    _contactController.text = widget.object[0]["contact"].toString();
    _emailController.text = widget.object[0]["email"];
    openingTime.text = widget.object[0]["opening"];
    closingTime.text = widget.object[0]["closing"];
  }

  final _formKey = GlobalKey<FormState>();

  final ImagePicker imgpicker = ImagePicker();
  int _value = 1;
  File? imagefiles;

  Future editStore(
      BuildContext context,
      int store_id,
      String name,
      String add1,
      String add2,
      String email,
      String contact,
      String openingTime,
      String closingTime) async {
    print(store_id);
    print(name);
    print(add1);
    print(add2);
    print(email);
    print(contact);
    print(openingTime);
    print(closingTime);
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    String? group = prefManager.getString(Constant.KEY_USER_GROUP);
    final response = await http.put(
        Uri.parse('${Constant.KEY_URL}/api/storeForSeller/update'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $login_token',
        },
        body: jsonEncode({
          "store_id": store_id,
          "store_name": name,
          "address1": add1,
          "address2": add2,
          "contact": contact,
          "email": email,
          "opening": openingTime,
          "closing": closingTime,
        }));

    if (response.statusCode == 200) {
      // print("dnfcdfmd $title");
      var res = jsonDecode(response.body);
      print(res);
      var respon = res["response"];
      var message = respon["message"];

      // prefManager.remove(Constant.KEY_DEVICE_TOKEN);
      //  // prefManager.clear();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyStores()));
      Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else if (response.statusCode > 200) {
      var data = jsonDecode(response.body);

      var rest = data["response"];
      var message1 = rest["message"];
      print(data);
      print(message1);
      Fluttertoast.showToast(
        msg: "$message1",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Internal Server Error Please try again",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw Exception('Failed to create album.');
    }
  }

  openImages() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.imagefiles = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.object);
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          // automaticallyImplyLeading: false,
          title: Text(
            "Edit Brand".toUpperCase(),
            style: TextStyle(fontSize: 15),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          // padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              // border: Border(top: BorderSide(color: Colors.grey, width: 5)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 80,
          child: SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Form(
                  key: _formKey,
                  // autovalidate: _autoValidate,
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 40),
                    padding: EdgeInsets.only(
                        top: 10, left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Add Store".toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Please enter details for adding Store:",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return '*Required Field! Please enter Store name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your  Store name',
                            labelText: ' Store Name',
                          ),
                          controller: _nameController,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return '*Required Field! Please enter Address 1';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Store Address 1',
                            labelText: ' Address 1',
                          ),
                          controller: _address1Controller,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return '*Required Field! Please enter Address 2';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Store Address 2',
                            labelText: ' Address 2',
                          ),
                          controller: _address2Controller,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return '*Required Field! Please enter Email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Store Email',
                            labelText: ' Email',
                          ),
                          controller: _emailController,
                        ),

                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return '*Required Field! Please enter Phone Number';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Store Phone number',
                            labelText: ' Phone',
                          ),
                          controller: _contactController,
                        ),
                        TextField(
                          controller: openingTime,
                          decoration: const InputDecoration(
                            hintText: 'Enter Store opening Time',
                            prefixIcon: Icon(Icons.timer),
                            labelText: ' Select Store Opening time',
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              print(pickedTime.format(context));
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              print(parsedTime);
                              String formattedTime =
                                  DateFormat('HH:mm:ss').format(parsedTime);
                              print(formattedTime);

                              setState(() {
                                openingTime.text = formattedTime;
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                        TextField(
                          controller: closingTime,
                          decoration: const InputDecoration(
                            hintText: 'Enter Store closing Time',
                            prefixIcon: Icon(Icons.timer),
                            labelText: ' Select Store closing time',
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              print(pickedTime.format(context));
                              DateTime parsedTime = DateFormat.jm()
                                  .parse(pickedTime.format(context).toString());
                              print(parsedTime);
                              String formattedTime =
                                  DateFormat('HH:mm:ss').format(parsedTime);
                              print(formattedTime);

                              setState(() {
                                closingTime.text = formattedTime;
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                        SizedBox(height: 30),
                        // Image.network(
                        //   widget.object[0]["brand_logo"],
                        //   width: 100,
                        //   height: 100,
                        // ),

                        // //open button ----------------
                        // ElevatedButton(
                        //     style: ButtonStyle(
                        //         backgroundColor: MaterialStateProperty.all(
                        //             Color.fromARGB(255, 204, 157, 118)),
                        //         shape: MaterialStateProperty.all<
                        //                 RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(30),
                        //         ))),
                        //     onPressed: () {
                        //       openImages();
                        //     },
                        //     child: Text(
                        //       "Change Brand logo",
                        //       style: TextStyle(color: Colors.white),
                        //     )),

                        // Text("Picked File:"),
                        // Divider(),
                        // imagefiles != null
                        //     ? Image.file(
                        //         imagefiles!,
                        //         width: 100,
                        //         height: 100,
                        //       )
                        //     : Text("No image selected"),

                        // SizedBox(
                        //   height: 20,
                        // ),
                        Container(
                            height: 60,
                            width: 280,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            // margin:
                            // EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 204, 157, 118)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              // BorderRadius.zero,
                                              BorderRadius.circular(30)))),
                              child: const Text(
                                'Update Store',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              onPressed: () {
                                editStore(
                                    context,
                                    widget.object[0]["store_id"],
                                    _nameController.text,
                                    _address1Controller.text,
                                    _address2Controller.text,
                                    _emailController.text,
                                    _contactController.text,
                                    openingTime.text,
                                    closingTime.text);
                                // EditBrand(
                                //     context,
                                //     _nameController.text,
                                //     _address1Controller.text,
                                //     imagefiles,
                                //     widget.object[0]["brand_id"]);
                                // addBasicFarm(
                                //     context,

                                //     _nameController.text,

                                //     _descriptionController.text,

                                //     imagefiles!);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => AddAddresses()),
                                // );
                              },
                            ))
                      ],
                    ),
                  ))),
        ),
      ),
    );
  }
}
