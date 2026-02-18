import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickController extends GetxController {
  DateRangePickerController pickerController = DateRangePickerController();

  String? startDate;
  String? startMonth;
  String? startYear;
  String? endDate;
  String? endMonth;
  String? endYear;

  DateTime? start;
  DateTime? end;

  List<DateTime> blackoutDates = <DateTime>[];
  bool selectionValid = true;

  void onSelectionChanged({required DateRangePickerSelectionChangedArgs args, required Function(bool value) onSelectionChanged}) {
    if (args.value is PickerDateRange) {
      final PickerDateRange range = args.value;
      start = range.startDate;
      end = range.endDate;

      if (start != null && end != null) {
        bool hasBlackout = blackoutDates.any(
          (blocked) => blocked.isAfter(start!.subtract(const Duration(days: 1))) && blocked.isBefore(end!.add(const Duration(days: 1))),
        );

        if (hasBlackout) {
          selectionValid = false;
          Get.snackbar("Invalid Selection", "You cannot select across blocked dates", backgroundColor: Colors.red, colorText: Colors.white);
        } else {
          selectionValid = true;
          onSelectionChanged(true);
        }
      }
      update();
    }
  }

  void saveRange() {
    if (start != null && end != null && selectionValid) {
      startDate = DateFormat('dd').format(start!);
      startMonth = DateFormat('MM').format(start!);
      startYear = DateFormat('yyyy').format(start!);

      endDate = DateFormat('dd').format(end!);
      endMonth = DateFormat('MM').format(end!);
      endYear = DateFormat('yyyy').format(end!);

      update();
    } else {
      Get.snackbar("Not Allowed", "Your selection is invalid. Please choose again.", backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void clearSelection() {
    // Clear variables
    start = null;
    end = null;
    startDate = startMonth = startYear = null;
    endDate = endMonth = endYear = null;
    selectionValid = true;

    // Clear calendar selection
    pickerController.selectedRange = null;

    update();
  }

  void updateBlackout(DateRangePickerViewChangedArgs args) {
    List<DateTime> temp = <DateTime>[];
    temp.add(DateTime(2025, 9, 30));
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      blackoutDates = temp;
      update();
    });
  }
}
