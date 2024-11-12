import 'dart:convert';
import 'dart:io';

import 'package:bhk_seller_app/screens/dashboardManagement/dashboard.dart';
import 'package:bhk_seller_app/screens/productManagement/my_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Constants/constants.dart';

import 'package:path_provider/path_provider.dart';
import 'package:async/async.dart';

class EditBrand extends StatefulWidget {
  final List object;
  EditBrand(this.object);
  // const EditBrand({Key? key}) : super(key: key);

  @override
  State<EditBrand> createState() => _EditBrandState();
}

class _EditBrandState extends State<EditBrand> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.object[0]["brand_name"];
    _descriptionController.text = widget.object[0]["description"];
  }

  final _formKey = GlobalKey<FormState>();

  final ImagePicker imgpicker = ImagePicker();
  int _value = 1;
  File? imagefiles;

  Future EditBrand(BuildContext context, String name, String des, File? images,
      int id) async {
    final prefManager = await SharedPreferences.getInstance();
    String? login_token = prefManager.getString(Constant.KEY_LOGIN_TOKEN);
    String? group = prefManager.getString(Constant.KEY_USER_GROUP);
    Map<String, String> headers = {'Authorization': 'Bearer $login_token'};
    // print(heading);
    // print(type);

    var req = http.MultipartRequest(
        'PUT', Uri.parse('${Constant.KEY_URL}/api/edit-brand'));
    if (images != null) {
      req.files.add(http.MultipartFile.fromBytes(
          'file', File(images.path).readAsBytesSync(),
          filename: images.path));
    }
    req.fields['brand_name'] = name.toString();
    req.fields['brand_id'] = id.toString();

    req.fields['description'] = des.toString();

    req.headers.addAll(headers);
    // req.files.add(http.MultipartFile.fromBytes(
    //     'file', File(image.path).readAsBytesSync(),
    //     filename: image.path));

    var respo = await req.send();

    // print(respo.statusCode);
    if (respo.statusCode == 200) {
      var res = await http.Response.fromStream(respo);
      final result = jsonDecode(res.body);
      var rest = result["response"];
      var message1 = rest["message"];
      print(respo);
      Fluttertoast.showToast(
        msg: "$message1",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => new DashBoard()),
          (route) => false);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => new MyDashboard()),
      //     (route) => false);
    } else if (respo.statusCode > 200) {
      var res = await http.Response.fromStream(respo);
      var data = jsonDecode(res.body);

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
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashBoard()),
            (route) => false);
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
        msg: "Internal Server Error Please try again",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green[400],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => new MyProductsList()),
      //     (route) => false);
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
                            Text("edit Product".toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Please enter details for editing brand:",
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
                              return '*Required Field! Please enter Product name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your  Brand name',
                            labelText: ' Brand Name',
                          ),
                          controller: _nameController,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == '') {
                              return '*Required Field! Please enter Description';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter Brand Description',
                            labelText: ' Description',
                          ),
                          controller: _descriptionController,
                        ),

                        SizedBox(height: 30),
                        Image.network(
                          widget.object[0]["brand_logo"],
                          width: 100,
                          height: 100,
                        ),

                        //open button ----------------
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 204, 157, 118)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ))),
                            onPressed: () {
                              openImages();
                            },
                            child: Text(
                              "Change Brand logo",
                              style: TextStyle(color: Colors.white),
                            )),

                        Text("Picked File:"),
                        Divider(),
                        imagefiles != null
                            ? Image.file(
                                imagefiles!,
                                width: 100,
                                height: 100,
                              )
                            : Text("No image selected"),

                        SizedBox(
                          height: 20,
                        ),
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
                                'Update Brand',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              onPressed: () {
                                EditBrand(
                                    context,
                                    _nameController.text,
                                    _descriptionController.text,
                                    imagefiles,
                                    widget.object[0]["brand_id"]);
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
