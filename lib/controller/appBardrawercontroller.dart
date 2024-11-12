import 'dart:convert';

import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:bhk_seller_app/common/Constants.dart';
import 'package:bhk_seller_app/model/getprofilemodel.dart';
import 'package:bhk_seller_app/model/logoutmodel.dart';
import 'package:bhk_seller_app/repository/logoutRepository.dart';
import 'package:bhk_seller_app/repository/profilerepository.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:get/get.dart';

import '../common/CommonMethods.dart';
import '../data/response/status.dart';
import '../resources/strings.dart';

class Appbardrawercontroller extends GetxController {
  final repository = LogoutRepository();
  final profilerepository = ProfileRepository();

  var isLoading = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;

  final logoutModel = LogoutModel().obs;
  void setError(String value) => error.value = value;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setLogoutdata(LogoutModel value) => logoutModel.value = value;

  final getProfileModel = GetProfileModel().obs;

  void setGetprofiledata(GetProfileModel value) =>
      getProfileModel.value = value;

  @override
  void onInit() {
    super.onInit();
    getProfileApi();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getProfileApi();
  }

  Future<void> getProfileApi() async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      profilerepository.getprofileApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setGetprofiledata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        print("redirect");
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

  Future<void> profileRefresh() async {
    // Simulate network fetch or database query
    await Future.delayed(Duration(seconds: 2));
    // Update the list of items and refresh the UI
    getProfileApi();
    print("items.length");
  }

  Future<void> logOutApi(context) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository.logoutApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setLogoutdata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
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

  redirect() {
    Utils.savePreferenceValues(Constants.accessToken, "");
    Utils.savePreferenceValues(Constants.email, "");
    Get.offNamed(RoutesClass.gotoLoginScreen());
  }
}
