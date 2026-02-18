import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/text/app_date_time_formate.dart';
import 'package:go_connect/utils/log_print.dart';

class SearchPageController extends GetxController {
  //////object
  AppDateTimeFormate formate = AppDateTimeFormate.instance;
  FocusNode focusNode = FocusNode();
  TextEditingController destinationTextEditingController = TextEditingController();

  RxString pickUpDate = "".obs;
  RxString pickUpTime = "".obs;

  RxString dropOffDate = "".obs;
  RxString dropOfTime = "".obs;

  void formatePickUpData(DateTime value) {
    try {
      pickUpDate.value = formate.timeFormateTextMonthDayYear(value.toIso8601String());
    } catch (e) {
      errorLog("formatePickUpData", e);
    }
  }

  void formatePickUpTime(TimeOfDay value) {
    try {
      pickUpTime.value = formate.formatTime(value);
    } catch (e) {
      errorLog("formatePickUpTime", e);
    }
  }

  void formateDropDate(DateTime value) {
    try {
      dropOffDate.value = formate.timeFormateTextMonthDayYear(value.toIso8601String());
    } catch (e) {
      errorLog("formateDropDate", e);
    }
  }

  void formateDropTime(TimeOfDay value) {
    try {
      dropOfTime.value = formate.formatTime(value);
    } catch (e) {
      errorLog("formateDropTime", e);
    }
  }

  void requestFocusNode() {
    try {
      if (focusNode.canRequestFocus) {
        focusNode.requestFocus();
      }
    } catch (e) {
      errorLog("requestFocusNode", e);
    }
  }

  void onAppInitial() {
    try {
      focusNode = FocusNode();
      destinationTextEditingController = TextEditingController();
    } catch (e) {
      errorLog("onAppInitial", e);
    }
  }

  void onAppClose() {
    try {
      focusNode.dispose();
      destinationTextEditingController.dispose();
    } catch (e) {
      errorLog("onAppClose", e);
    }
  }

  @override
  void onInit() {
    onAppInitial();
    super.onInit();
  }

  @override
  void onClose() {
    onAppClose();
    super.onClose();
  }
}
