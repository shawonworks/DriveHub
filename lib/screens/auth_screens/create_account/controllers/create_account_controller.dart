import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/log_print.dart';

class CreateAccountController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();

  Rx<Country> selectedCountry = Country(
    phoneCode: '228',
    countryCode: 'TG',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Togo',
    example: '90 00 00 00',
    displayName: 'Togo',
    displayNameNoCountryCode: 'Togo',
    e164Key: '',
  ).obs;

  void createAccount(GlobalKey<FormState> formKey) {
    try {
      if (formKey.currentState!.validate()) {
        Get.toNamed(AppRoutes.verificationForAccountPage, arguments: emailTextController.text);
      }
    } catch (e) {
      errorLog("message", e);
    }
  }

  void onAppInitialDataLoad() {
    try {
      firstNameTextController = TextEditingController();
      lastNameTextController = TextEditingController();
      emailTextController = TextEditingController();
      passwordTextController = TextEditingController();
      confirmPasswordTextController = TextEditingController();
    } catch (e) {}
  }

  void disposeFunc() {
    try {
      firstNameTextController.dispose();
      lastNameTextController.dispose();
      emailTextController.dispose();
      passwordTextController.dispose();
      confirmPasswordTextController.dispose();
    } catch (e) {
      errorLog("disposeFunc", e);
    }
  }

  @override
  void onInit() {
    onAppInitialDataLoad();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    disposeFunc();
  }
}
