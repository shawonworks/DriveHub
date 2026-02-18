import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/date_screen.dart/date_pick_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePick extends StatelessWidget {
  const DatePick({super.key, required this.onSelectionChanged});
  final dynamic Function(bool) onSelectionChanged;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickController>(
      init: DatePickController(),
      builder: (controller) {
        return Card(
          elevation: 5,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: SfDateRangePicker(
              headerStyle: DateRangePickerHeaderStyle(backgroundColor: Colors.white),
              controller: controller.pickerController,
              backgroundColor: Colors.white,
              selectionColor: Colors.white,
              selectionMode: DateRangePickerSelectionMode.range,
              minDate: DateTime.now(),
              maxDate: DateTime(DateTime.now().year, DateTime.now().month + 2, DateTime.now().day),
              monthViewSettings: DateRangePickerMonthViewSettings(blackoutDates: controller.blackoutDates),
              monthCellStyle: const DateRangePickerMonthCellStyle(blackoutDateTextStyle: TextStyle(color: Colors.grey)),
              showActionButtons: true,
              showNavigationArrow: true,
              onSelectionChanged: (dateRangePickerSelectionChangedArgs) =>
                  controller.onSelectionChanged(args: dateRangePickerSelectionChangedArgs, onSelectionChanged: (value) {}),
              onSubmit: (Object? value) {
                controller.saveRange();

                if (value != null) {
                  onSelectionChanged(true);
                }
              },
              onCancel: () {
                controller.clearSelection();
                onSelectionChanged(false);
              },
              onViewChanged: controller.updateBlackout,
            ),
          ),
        );
      },
    );
  }
}
