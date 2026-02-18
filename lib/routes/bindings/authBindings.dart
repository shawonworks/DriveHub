import 'package:get/get.dart';
import 'package:go_connect/screens/auth_screens/create_account/controllers/create_account_controller.dart';
import 'package:go_connect/screens/auth_screens/forgetPassword/controllers/forgetPasswordController.dart';
import 'package:go_connect/screens/auth_screens/forgetPasswordOTP/controllers/forgetPasswordOTPController.dart';
import 'package:go_connect/screens/auth_screens/resetPassword/controllers/resetPasswordController.dart';
import 'package:go_connect/screens/auth_screens/signIn/controllers/signIn_controller.dart';
import 'package:go_connect/screens/auth_screens/verificationforAccount/controllers/verificationforAccountController.dart';

class Authbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController());
    Get.lazyPut(() => SigninController());
    Get.lazyPut(() => Verificationforaccountcontroller());
    Get.lazyPut(() => Forgetpasswordcontroller());
    Get.lazyPut(() => Forgetpasswordotpcontroller());
    Get.lazyPut(() => Resetpasswordcontroller());
  }
}
