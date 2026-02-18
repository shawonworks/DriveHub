import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpasswordcontroller extends GetxController {
  TextEditingController resetpassPasswordConttroller = TextEditingController();
  TextEditingController resetConfirmPassEmailConttroller = TextEditingController();
  GlobalKey<FormState>  resetpassValidKey = GlobalKey<FormState>();

  @override
  void dispose() {
    disposeFunc();
    super.dispose();
  }

  void disposeFunc() {
    try {
      resetpassPasswordConttroller.dispose();
      resetConfirmPassEmailConttroller.dispose();
    } catch (e) {
      print(e);
    }
  }
}
