import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/log_print.dart';
import 'package:go_connect/utils/storage_service.dart';

class SigninController extends GetxController {
  TextEditingController signInEmailTextController = TextEditingController();
  TextEditingController signInPasswordTextController = TextEditingController();
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
  void signIn(GlobalKey<FormState> formKey) async {
    try {
      if (formKey.currentState!.validate()) {
        AppStorage().setLoginValue(true);
        Get.offAllNamed(AppRoutes.navbar);
      }
    } catch (e) {
      errorLog("signIn", e);
    }
    // final value=await AppStorage().getRole();
    // print("values : 😂😂😂😂😂$value");
    // final role=await AppStorage().getRole();
    // print("role : 😂😂😂😂😂$role");
    // if(role=="user"){
    //   Get.toNamed(AppRoutes.navbar);
    // }
    // else
    //   {
    //     Get.toNamed(AppRoutes.hostNavBar);
    //   }
  }

  void onAppInitialDataLoad() {
    signInEmailTextController = TextEditingController();
    signInPasswordTextController = TextEditingController();
  }

  void disposeFunc() {
    signInEmailTextController.dispose();
    signInPasswordTextController.dispose();
  }

  @override
  void onInit() {
    onAppInitialDataLoad();
    super.onInit();
  }

  @override
  void dispose() {
    disposeFunc();
    super.dispose();
  }
}
