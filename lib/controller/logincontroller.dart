import 'dart:convert';

import 'package:bhk_seller_app/common/constants.dart';
import 'package:bhk_seller_app/model/signUpModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Constants/utils.dart';
import '../common/commonmethods.dart';
import '../data/response/status.dart';
import '../repository/loginRepository.dart';
import '../resources/strings.dart';
import '../routes/RoutesClass.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var countryCode = "".obs;
  ValueNotifier userCredential = ValueNotifier('');

  late final AnimationController animationController;
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  final _api = LoginRepository();
  var checkInternetValue = false.obs();
  var phoneNumberFocusNode = FocusNode().obs;
  var errorMessage = "".obs;
  final rxRequestStatus = Status.COMPLETED.obs;
  final logInData = SignUpModel().obs;
  void setError(String value) => error.value = value;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setLoginData(SignUpModel value) => logInData.value = value;

  var textFieldFocusNode = FocusNode().obs;
  var obscured = true.obs;
  void toggleObscured() {
    obscured.value = !obscured.value;

    // If the focus is on the text field, do not change focus
    if (textFieldFocusNode.value.hasPrimaryFocus) {
      return;
    }

    // Prevent focus changes if the eye icon is tapped
    textFieldFocusNode.value.canRequestFocus = false;
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<void> logInAndRegister(context) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      Map<String, dynamic> data = {
        "identity": emailController.value.text.isNotEmpty
            ? emailController.value.text
            : phoneController.value.text,
        "group": "SELLER",
        if (phoneController.value.text.isNotEmpty)
          "countryCode":
              countryCode.value // Assume you have the country code stored
      };
      _api.logInApi(data).then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setLoginData(value);
        CommonMethods.showToast("${value.message} ${value.data?.otp}");
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
        redirect();
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        if (error.toString().contains("{")) {
          var errorResponse = json.decode(error.toString());
          print("errrrorrr=====>$errorResponse");
          if (errorResponse is Map || errorResponse.containsKey('message')) {
            CommonMethods.showToast(errorResponse['message']);
          } else {
            CommonMethods.showToast("An unexpected error occurred.");
          }
        }
        Utils.printLog("Error===> ${error.toString()}");
      });
    } else {
      CommonMethods.showToast(appStrings.weUnableCheckData);
    }
  }

  void redirect() {
    print("redirect");
    print(logInData.value.statusCode);
    Utils.savePreferenceValues(
        Constants.referenceId, "${logInData.value.data?.referenceId}");
    Get.toNamed(RoutesClass.gotoVerifyScreen(), arguments: {
      'referenceId': logInData.value.data?.referenceId,
      "identity": emailController.value.text.isNotEmpty
          ? emailController.value.text
          : phoneController.value.text,
      if (phoneController.value.text.isNotEmpty)
        "countryCode": countryCode.value
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
