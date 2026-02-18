import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  TextEditingController currrentPassword = TextEditingController();
  TextEditingController setPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> signInValidKey = GlobalKey<FormState>();

  @override
  void onClose() {
    currrentPassword.dispose();
    setPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
