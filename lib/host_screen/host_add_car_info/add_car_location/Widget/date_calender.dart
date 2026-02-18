// lib/host_screen/host_add_car_info/add_car_location/Widget/date_calender.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../../../utils/gap.dart';
import '../add_car_location_controller/add_car_location_controller.dart';

class AvailableDateCalendar extends StatelessWidget {
  const AvailableDateCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarLocationController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(AppSize.width(value: 14)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSize.width(value: 16)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: AppSize.width(value: 6))],
          ),
          child: Column(
            children: [
              /////////////Month + Year Dropdown//////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<int>(
                    value: controller.selectedMonth,
                    items: List.generate(12, (i) => DropdownMenuItem(value: i + 1, child: Text(controller.monthName(i + 1)))),
                    onChanged: (value) => controller.onMonthChanged(value!),
                  ),
                  SizedBox(width: AppSize.width(value: 10)),
                  DropdownButton<int>(
                    value: controller.selectedYear,
                    items: controller.years.map((year) => DropdownMenuItem(value: year, child: Text("$year"))).toList(),
                    onChanged: (value) => controller.onYearChanged(value!),
                  ),
                ],
              ),

              Gap(height: 8),

              //////////////////Main Calendar////////////////
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2035, 12, 31),
                focusedDay: controller.focusedDay.value,
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) => controller.selectedDays.any((d) => controller.isSameDay(d, day)),
                onDaySelected: controller.onDaySelected,
                onPageChanged: controller.onPageChanged,
                headerVisible: false,
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(color: ConstColor.primaryColor, shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
                  outsideDaysVisible: false,
                ),
              ),

              Gap(height: 12),

              //////////////////Selected Count////////////////
              Text(
                "${controller.selectedDays.length} dates selected",
                style: TextStyle(color: Colors.teal, fontSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
