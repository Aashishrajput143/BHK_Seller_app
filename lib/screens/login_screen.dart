import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/logincontroller.dart';
import 'package:bhk_seller_app/resources/inputformatter.dart';
import 'package:bhk_seller_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Constants/constants.dart';
import '../data/response/status.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Obx(() => GestureDetector(
            child: Stack(
          children: [
            SizedBox(
                child: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 120,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(150),
                                            bottomLeft: Radius.circular(150))),
                                    child: Center(
                                      child: Image.asset(
                                        Constant.backss,
                                        height: 125.0,
                                        width: 125.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        // Display error message
                                        if (controller.errorMessage.value !=
                                            "") ...[
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
                                                    controller
                                                        .errorMessage.value,
                                                    style: const TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                        const SizedBox(height: 20),
                                        Text(
                                          appStrings.letsSignIn,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          appStrings.welcomeBack,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 30),
                                        // Email Field
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            cursorColor: Colors.white,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            controller: controller
                                                .emailController.value,
                                            inputFormatters: [
                                              EmailInputFormatter(),
                                              NoLeadingSpaceFormatter(),
                                              EmojiInputFormatter(),
                                              //RemoveTrailingPeriodsFormatter(),
                                              LengthLimitingTextInputFormatter(
                                                  50), // Optional: Limit email length
                                            ],
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.errorMessage.value =
                                                    "";
                                                controller.phoneController.value
                                                    .text = "";
                                                controller.countryCode.value =
                                                    "";
                                              }
                                            },
                                            decoration: InputDecoration(
                                              hintText: appStrings.emailHint,
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
                                                horizontal: 20.0,
                                                vertical: 5.0,
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(height: 15),
                                        Text(
                                          appStrings.or,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 15),

                                        IntlPhoneField(
                                          focusNode: controller
                                              .phoneNumberFocusNode.value,
                                          controller:
                                              controller.phoneController.value,
                                          inputFormatters: [
                                            NoLeadingZeroFormatter(), // Custom formatter to prevent leading zero
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                10),
                                          ],
                                          decoration: InputDecoration(
                                            labelText: appStrings.phone,
                                            labelStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set label text color to white
                                            hintText: appStrings.phoneHint,
                                            hintStyle: const TextStyle(
                                                color: Colors
                                                    .white), // Set hint text color to white
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 2.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.white,
                                                  width: 2.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              borderSide: const BorderSide(
                                                  color: Colors.red,
                                                  width: 2.0),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 5.0),
                                          ),
                                          style: const TextStyle(
                                              color: Colors
                                                  .white), // Set text color to white
                                          dropdownTextStyle: const TextStyle(
                                              color: Colors
                                                  .white), // Set dropdown text color to white
                                          cursorColor: Colors
                                              .white, // Set cursor color to white
                                          dropdownIcon: Icon(
                                              Icons.arrow_drop_down,
                                              color: const Color.fromARGB(
                                                  255,
                                                  190,
                                                  190,
                                                  190)), // Set custom icon color
                                          initialCountryCode: 'IN',
                                          languageCode: "en",
                                          onChanged: (phone) {
                                            controller.errorMessage.value = "";
                                            print(phone.completeNumber);
                                            controller.countryCode.value =
                                                phone.countryCode;
                                            if (phone.number.isNotEmpty) {
                                              controller.emailController.value
                                                  .text = "";
                                            }
                                          },
                                          onCountryChanged: (country) {
                                            print(
                                                'Country changed to: ${country.dialCode}');
                                          },
                                        ),

                                        // Password Field
                                        // Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: TextFormField(
                                        //     cursorColor: Colors.white,
                                        //     style: const TextStyle(color: Colors.white),
                                        //     controller: controller.passwordController.value,
                                        //     keyboardType: TextInputType.visiblePassword,
                                        //     obscureText: controller.obscured.value,
                                        //     focusNode: controller.textFieldFocusNode.value,
                                        //     decoration: InputDecoration(
                                        //       suffixIcon: Padding(
                                        //         padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                        //         child: GestureDetector(
                                        //           onTap: controller.toggleObscured,
                                        //           child: Icon(
                                        //             controller.obscured.value
                                        //                 ? Icons.visibility_rounded
                                        //                 : Icons.visibility_off_rounded,
                                        //             size: 24,color: Colors.white,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       hintText: appStrings.password,
                                        //       hintStyle: const TextStyle(color: Colors.white),  // Set hint text color to white
                                        //       labelText: appStrings.password,
                                        //       labelStyle: const TextStyle(color: Colors.white), // Set label text color to white
                                        //       enabledBorder: OutlineInputBorder(
                                        //         borderRadius: BorderRadius.circular(25.0),
                                        //         borderSide: const BorderSide(
                                        //           color: Colors.white,
                                        //           width: 2.0,
                                        //         ),
                                        //       ),
                                        //       focusedBorder: OutlineInputBorder(
                                        //         borderRadius: BorderRadius.circular(25.0),
                                        //         borderSide: const BorderSide(
                                        //           color: Colors.white,
                                        //           width: 2.0,
                                        //         ),
                                        //       ),
                                        //       errorBorder: OutlineInputBorder(
                                        //         borderRadius: BorderRadius.circular(25.0),
                                        //         borderSide: const BorderSide(
                                        //           color: Colors.red,
                                        //           width: 2.0,
                                        //         ),
                                        //       ),
                                        //       focusedErrorBorder: OutlineInputBorder(
                                        //         borderRadius: BorderRadius.circular(25.0),
                                        //         borderSide: const BorderSide(
                                        //           color: Colors.red,
                                        //           width: 2.0,
                                        //         ),
                                        //       ),
                                        //       contentPadding: const EdgeInsets.symmetric(
                                        //         horizontal: 10.0,
                                        //         vertical: 5.0,
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),

                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 204, 157, 118),
                                              ),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              appStrings.getOTP,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            onPressed: () {
                                              if (controller.emailController
                                                      .value.text.isEmpty &&
                                                  controller.phoneController
                                                      .value.text.isEmpty) {
                                                controller.errorMessage.value =
                                                    appStrings
                                                        .loginerrormessage;
                                              } else {
                                                controller.errorMessage.value =
                                                    "";
                                                FocusScope.of(context)
                                                    .unfocus();
                                                controller
                                                    .logInAndRegister(context);
                                              }
                                            },
                                          ),
                                        ),
                                        // const SizedBox(height: 20),
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     Text(
                                        //       appStrings.dontHaveAccount,
                                        //       style: const TextStyle(fontSize: 12,color: Colors.white),
                                        //     ),
                                        //     InkWell(
                                        //       onTap: () {
                                        //         Navigator.push(
                                        //           context,
                                        //           MaterialPageRoute(
                                        //             builder: (context) => RegistrationScreen(),
                                        //           ),
                                        //         );
                                        //       },
                                        //       child: Text(
                                        //         appStrings.signUp,
                                        //         style: const TextStyle(
                                        //           fontSize: 12,
                                        //           fontWeight: FontWeight.bold,color: Colors.white
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: ValueListenableBuilder(
                                              valueListenable:
                                                  controller.userCredential,
                                              builder: (context, value, child) {
                                                return (controller
                                                                .userCredential
                                                                .value ==
                                                            '' ||
                                                        controller
                                                                .userCredential
                                                                .value ==
                                                            null)
                                                    ? Card(
                                                        elevation: 4,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            IconButton(
                                                              iconSize: 40,
                                                              icon: Image.asset(
                                                                'assets/images/google_icon.png',
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                controller
                                                                        .userCredential
                                                                        .value =
                                                                    await controller
                                                                        .signInWithGoogle();
                                                                if (controller
                                                                        .userCredential
                                                                        .value !=
                                                                    null)
                                                                  print(controller
                                                                      .userCredential
                                                                      .value
                                                                      .user!
                                                                      .email);
                                                              },
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          11),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  controller
                                                                          .userCredential
                                                                          .value =
                                                                      await controller
                                                                          .signInWithGoogle();
                                                                  if (controller
                                                                          .userCredential
                                                                          .value !=
                                                                      null)
                                                                    print(controller
                                                                        .userCredential
                                                                        .value
                                                                        .user!
                                                                        .email);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "Continue with Google",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                    : GestureDetector(
                                                        onTap: () async {
                                                          bool result =
                                                              await controller
                                                                  .signOutFromGoogle();
                                                          if (result)
                                                            controller
                                                                .userCredential
                                                                .value = '';
                                                        },
                                                        child: Card(
                                                          elevation: 4,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width:
                                                                    50, // Set the width and height to create a circular button
                                                                height: 50,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle, // This makes the button circular
                                                                  color: Colors
                                                                      .transparent, // You can set a background color if needed
                                                                ),
                                                                child:
                                                                    IconButton(
                                                                  iconSize: 40,
                                                                  icon:
                                                                      ClipOval(
                                                                    child: Image
                                                                        .network(
                                                                      controller
                                                                          .userCredential
                                                                          .value
                                                                          .user!
                                                                          .photoURL
                                                                          .toString(),
                                                                      width:
                                                                          40, // Set the size to match the circular container
                                                                      height:
                                                                          40,
                                                                      fit: BoxFit
                                                                          .cover, // Ensures the image fills the circle properly
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    bool
                                                                        result =
                                                                        await controller
                                                                            .signOutFromGoogle();
                                                                    if (result) {
                                                                      controller
                                                                          .userCredential
                                                                          .value = '';
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                            12),
                                                                child: Text(
                                                                    controller
                                                                        .userCredential
                                                                        .value
                                                                        .user!
                                                                        .email
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                              }),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                        Text(
                                          appStrings.privacyPolicy,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
            progressBarTransparent(
                controller.rxRequestStatus.value == Status.LOADING,
                MediaQuery.of(context).size.height,
                MediaQuery.of(context).size.width)
          ],
        )));
  }
}
