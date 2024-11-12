import 'dart:convert';
import 'dart:io';

import 'package:bhk_seller_app/Constants/utils.dart';
import 'package:bhk_seller_app/model/addstoremodel.dart';
import 'package:bhk_seller_app/repository/storerepository.dart';
import 'package:bhk_seller_app/routes/RoutesClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../common/CommonMethods.dart';
import '../data/response/status.dart';
import '../resources/strings.dart';

class AddStoreController extends GetxController {
  final repository = StoreRepository();

  var nameController = TextEditingController().obs;
  var addresshouseController = TextEditingController().obs;
  var addressstreetController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;
  var pincodeController = TextEditingController().obs;
  //var openingTime = TextEditingController().obs;
  //var closingTime = TextEditingController().obs;

  // @override
  // void initState() {
  //   openingTime.text = "";
  //   closingTime.text = "";
  // }

  String? countryValue;
  String? stateValue;
  String? cityValue;

  final ImagePicker imgpicker = ImagePicker();
  var imagefiles = Rxn<File>();
  String errormessage = "";

  int count = 0;

  openImages(context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      imagefiles.value = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // Group Value for Radio Button.
  int indexs = 1;

  var isLoading = false.obs;
  final rxRequestStatus = Status.COMPLETED.obs;

  final addStoreModel = AddStoreModel().obs;
  void setError(String value) => error.value = value;
  RxString error = ''.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setaddstoredata(AddStoreModel value) => addStoreModel.value = value;

  Future<void> addStoreApi(context) async {
    var connection = await CommonMethods.checkInternetConnectivity();
    Utils.printLog("CheckInternetConnection===> ${connection.toString()}");

    Map<String, dynamic> data = {
      "store_name": nameController.value.text,
      "description": descriptionController.value.text,
      "address[street]": addressstreetController.value.text,
      "address[houseNo]": addresshouseController.value.text,
      "address[city]": cityValue,
      "address[country]": countryValue,
      "address[addressType]": "OFFICE",
      "address[postalCode]": pincodeController.value.text,
      "address[state]": stateValue,
    };

    if (connection == true) {
      setRxRequestStatus(Status.LOADING);

      repository
          .addstoreApi(data, imagefiles.value?.path.toString())
          .then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setaddstoredata(value);
        CommonMethods.showToast(value.message);
        Utils.printLog("Response===> ${value.toString()}");
        Get.offNamed(RoutesClass.gotoStoreScreen());
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
}
