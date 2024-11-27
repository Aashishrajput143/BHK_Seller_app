import 'package:bhk_seller_app/Constants/constants.dart';
import 'package:bhk_seller_app/controller/registrationcontroller.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:bhk_seller_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/colors.dart';

class RegistrationScreen extends ParentWidget {
  const RegistrationScreen({super.key});

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    RegistrationController controller = Get.put(RegistrationController());
    return Obx(
      () => SizedBox(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Color(appColors.colorPrimary),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 26,
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        Constant.backgroundImage,
                        height: MediaQuery.of(context).size.height * 0.99,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit
                            .cover, // Ensures the background image covers the entire area.
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  // border: Border(top: BorderSide(color: Colors.grey, width: 5)),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  )),
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: Column(
                                    children: [
                                      // Display error message
                                      if (controller.errorMessage != null) ...[
                                        Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 16.0),
                                          padding: const EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: Colors.red[100],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(Icons.error,
                                                  color: Colors.red),
                                              const SizedBox(width: 8.0),
                                              Expanded(
                                                child: Text(
                                                  controller.errorMessage!,
                                                  style: const TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        appStrings.createAccount,
                                        style: const TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        appStrings.afterComplete,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      Text(
                                        appStrings.opportunity,
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller:
                                              controller.nameController.value,
                                          decoration: InputDecoration(
                                            hintText: appStrings.username,
                                            hintStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set hint text color to white
                                            labelText: appStrings.username,
                                            labelStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set label text color to white
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                              vertical: 5.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller:
                                              controller.emailController.value,
                                          decoration: InputDecoration(
                                            hintText: appStrings.email,
                                            hintStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set hint text color to white
                                            labelText: appStrings.email,
                                            labelStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set label text color to white
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 10.0,
                                              vertical: 5.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: controller
                                              .passwordController.value,
                                          // Use secure text for passwords.
                                          decoration: InputDecoration(
                                            hintText: appStrings.password,
                                            labelText: appStrings.password,
                                            labelStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set label text color to white
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 5.0),
                                          ),

                                          // validator: this._validatePassword,
                                          // onSaved: (String value) {
                                          //   this._data.password = value;
                                          // }
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: controller
                                              .cPasswordController.value,
                                          // Use secure text for passwords.
                                          decoration: InputDecoration(
                                            hintText: 'confirm password',
                                            labelText: 'Confirm Password',
                                            labelStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set label text color to white
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),

                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 5.0),
                                          ),

                                          // validator: this._validatePassword,
                                          // onSaved: (String value) {
                                          //   this._data.password = value;
                                          // }
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          cursorColor: Colors.white,
                                          style: const TextStyle(
                                              color: Colors.white),

                                          controller:
                                              controller.numController.value,
                                          // Use secure text for passwords.
                                          decoration: InputDecoration(
                                            hintText: 'Phone',
                                            labelText: 'Phone',

                                            labelStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set label text color to white
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 2.0,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                color: Colors.red,
                                                width: 2.0,
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 5.0),
                                          ),

                                          // validator: this._validatePassword,
                                          // onSaved: (String value) {
                                          //   this._data.password = value;
                                          // }
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 45,
                                      ),
                                      const SizedBox(height: 20),
                                      Container(
                                          height: 50,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          // margin:
                                          // EdgeInsets.only(top: 10),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        const Color.fromARGB(
                                                            255,
                                                            204,
                                                            157,
                                                            118)),
                                                shape: WidgetStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            // BorderRadius.zero,
                                                            BorderRadius
                                                                .circular(
                                                                    30)))),
                                            child: const Text(
                                              'SIGN UP',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            onPressed: () {
                                              if (controller.nameController
                                                      .value.text.isNotEmpty &&
                                                  controller.emailController.value.text
                                                      .isNotEmpty &&
                                                  controller.passwordController.value.text
                                                      .isNotEmpty &&
                                                  controller.cPasswordController
                                                      .value.text.isNotEmpty &&
                                                  controller.numController.value
                                                      .text.isNotEmpty) {
                                                controller.logIn(context);

                                                controller.errorMessage =
                                                    null; // Clear previous error

                                                // Simulate registration success or error
                                              } else {
                                                controller.errorMessage =
                                                    'Please fill the details.';
                                              }
                                            },
                                          )),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            appStrings.alreadyAccount,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationScreen(),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              appStrings.signIn,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      ),
                                      Text(
                                        appStrings.singingPrivacyPolicy,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      // Positioned(
                                      //   // alignment: Alignment.bottomCenter,
                                      //   bottom: 10,
                                      //   child:

                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
