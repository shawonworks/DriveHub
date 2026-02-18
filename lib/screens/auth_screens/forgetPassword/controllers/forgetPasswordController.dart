import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpasswordcontroller extends GetxController {
  TextEditingController forgotpassEmailConttroller =
      TextEditingController();
  GlobalKey<FormState> forgotpassValidKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initFunc();
    super.onInit();
  }

  @override
  void dispose() {
    disposeFunc();
    super.dispose();
  }

  void initFunc() {
    forgotpassEmailConttroller = TextEditingController();
  }

  void disposeFunc() {
    forgotpassEmailConttroller.dispose();
  }
}
