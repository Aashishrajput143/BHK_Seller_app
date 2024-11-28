import 'package:get/get.dart';

import '../controller/registrationcontroller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}
