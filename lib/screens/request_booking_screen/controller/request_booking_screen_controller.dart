import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/text/app_date_time_formate.dart';
import 'package:go_connect/utils/log_print.dart';

class RequestBookingScreenController extends GetxController {
  //////object
  AppDateTimeFormate formate = AppDateTimeFormate.instance;
  RxBool isAgreeTermsAndCondition = false.obs;

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
}
