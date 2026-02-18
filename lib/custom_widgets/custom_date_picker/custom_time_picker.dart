import 'package:flutter/material.dart';
import 'package:go_connect/utils/log_print.dart';

Future<void> customTimePicker({
  required BuildContext context,
  required Function(TimeOfDay value) onTimeSelected,
  bool alwaysUse24HourFormat = false,
}) async {
  try {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: alwaysUse24HourFormat),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary: Colors.white60, onPrimary: Colors.white60, onSurface: Colors.white60),
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.blueGrey,
                hourMinuteTextColor: Colors.black87,
                hourMinuteColor: Colors.grey,
                dayPeriodColor: WidgetStateColor.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? Colors
                            .grey // Selected AM/PM color
                      : Colors.grey.withValues(alpha: 0.2),
                ), // Unselected AM/PM color

                dayPeriodTextColor: WidgetStateColor.resolveWith((states) => Colors.black),
                dialBackgroundColor: Colors.grey,
                dayPeriodBorderSide: BorderSide(
                  color: Colors.black, // Custom border color for AM/PM selector
                  width: 2, // Border width
                ),
                helpTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (pickedTime != null) {
      onTimeSelected(pickedTime);
    }
  } catch (e) {
    errorLog("customTimePicker", e);
  }
}
