import 'package:get/get.dart';

abstract class SuccessRessetPasswordController extends GetxController {
  gotologin();
}

class SuccessRessetPasswordControllerImp extends SuccessRessetPasswordController {
  @override
  gotologin() {
    // Get.offAllNamed(Approutes.login);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
