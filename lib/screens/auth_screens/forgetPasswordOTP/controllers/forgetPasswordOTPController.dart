import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpasswordotpcontroller extends GetxController {
  TextEditingController frgtPassPinCodeController = TextEditingController();
  GlobalKey<FormState> frgtPassOTPValidKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    disposeFunc();
  }

  void disposeFunc() {
    try {
      frgtPassPinCodeController.dispose();
    } catch (e) {
      print(e);
    }
  }
}
