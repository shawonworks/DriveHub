import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_info_tab_bar/add_car_info_tab_bar_controller/add_car_info_tab_bar_controller.dart';
import 'package:go_connect/utils/log_print.dart';

class CarBasicInformationController extends GetxController {
  var brand = ''.obs;
  var model = ''.obs;
  var year = ''.obs;
  var transmission = ''.obs;
  var fuelType = ''.obs;
  var seatNumber = ''.obs;

  bool get isValid =>
      brand.value.isNotEmpty &&
      model.value.isNotEmpty &&
      year.value.isNotEmpty &&
      transmission.value.isNotEmpty &&
      fuelType.value.isNotEmpty &&
      seatNumber.value.isNotEmpty;

  void nextButton(GlobalKey<FormState> formKey) {
    try {
      //
      if (!formKey.currentState!.validate()) {
        return;
      }

      Get.put(AddCarController()).nextPage();
    } catch (e) {
      errorLog("nextButton", e);
    }
  }
}
