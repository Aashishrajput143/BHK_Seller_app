

import 'package:get/get.dart';

import '../controller/logincontroller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}