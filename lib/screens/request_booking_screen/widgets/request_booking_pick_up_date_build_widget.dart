import 'package:flutter/material.dart';
import 'package:go_connect/custom_widgets/custom_date_picker/custom_show_date_picker.dart';
import 'package:go_connect/custom_widgets/custom_date_picker/custom_time_picker.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class RequestBookingPickUpDateBuildWidget extends StatelessWidget {
  const RequestBookingPickUpDateBuildWidget({
    super.key,
    required this.date,
    required this.time,
    required this.onDateSelected,
    required this.onTimeSelected,
  });
  final String date;
  final String time;
  final Function(DateTime value) onDateSelected;
  final Function(TimeOfDay value) onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: "Pick up date", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 14)),
              InkWell(
                onTap: () {
                  showCustomCalendarView(initialDate: DateTime.now(), firstDate: DateTime.now(), context: context, onDateSelected: onDateSelected);
                },
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 5),
                    vertical: AppSize.width(value: 5),
                  ).copyWith(left: AppSize.width(value: 10)),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(AppSize.width(value: 20)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(title: date, fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.calendar_month_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: "Time", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 14)),
              InkWell(
                onTap: () {
                  customTimePicker(context: context, onTimeSelected: onTimeSelected);
                },
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.width(value: 5),
                    vertical: AppSize.width(value: 5),
                  ).copyWith(left: AppSize.width(value: 10)),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(AppSize.width(value: 20)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomText(title: time, fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.expand_more),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
