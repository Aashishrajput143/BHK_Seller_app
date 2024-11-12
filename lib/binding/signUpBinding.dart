

import 'package:get/get.dart';

import '../controller/registrationController.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }

}