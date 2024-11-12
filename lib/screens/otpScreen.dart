import 'package:bhk_seller_app/common/myUtils.dart';
import 'package:bhk_seller_app/controller/otpController.dart';
import 'package:bhk_seller_app/main.dart';
import 'package:bhk_seller_app/resources/component/inputformatter.dart';
import 'package:bhk_seller_app/resources/strings.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../Constants/constants.dart';
import '../data/response/status.dart';

class Otpscreen extends ParentWidget {
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    OtpController controller = Get.put(OtpController());
    return Obx(() => Stack(
          children: [
            Scaffold(
              extendBodyBehindAppBar: true,
              body: SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.asset(
                        Constant.backgroundImage,
                        height: MediaQuery.of(context).size.height * 0.99,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit
                            .cover, // Ensures the background image covers the entire area.
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/loader1.gif',
                                width: 150,
                                height: 150,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                appStrings.phoneVerification,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "We need to register your phone without getting started!",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Pinput(
                                controller: controller.otpController.value,
                                inputFormatters: [
                                  NoLeadingSpaceFormatter(),
                                  LengthLimitingTextInputFormatter(6),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                length: 6,
                                // defaultPinTheme: defaultPinTheme,
                                // focusedPinTheme: focusedPinTheme,
                                // submittedPinTheme: submittedPinTheme,

                                showCursor: true,
                                onCompleted: (pin) {
                                  controller.otp.value = pin.toString();
                                },
                              ),
                              SizedBox(
                                  width: w * 0.8,
                                  child: controller.startTime.value > 0
                                      ? Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            appStrings.reSendCode +
                                                controller.startTime.value
                                                    .toString() +
                                                ' sec',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            controller.resendOtp(context);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              appStrings.reSend,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ))),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 204, 157, 118)),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 255, 255, 255)),
                                        shape: WidgetStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    // BorderRadius.zero,
                                                    BorderRadius.circular(
                                                        30)))),
                                    onPressed: () {
                                      controller.otpVerification(context);
                                    },
                                    child: const Text("Verify Phone Number")),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.offNamed(
                                            RoutesClass.gotoLoginScreen());
                                      },
                                      child: Text(
                                        appStrings.editNumber,
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        top: 10.0, // Adjust the position as needed
                        left: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            progressBarTransparent(
                controller.rxRequestStatus.value == Status.LOADING, h, w)
          ],
        ));
  }
}
