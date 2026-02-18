import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Verificationforaccountcontroller extends GetxController {
  TextEditingController varificationPinCodeController = TextEditingController();
  GlobalKey<FormState> varificationValidKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    disposeFunc();
  }

  void disposeFunc() {
    try {
      varificationPinCodeController.dispose();
    } catch (e) {
      print(e);
    }
  }
}
