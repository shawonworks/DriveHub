// lib/host_screen/host_add_car_info/add_car_location/add_car_location_controller/add_car_location_controller.dart
import 'package:get/get.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_info_tab_bar/add_car_info_tab_bar_controller/add_car_info_tab_bar_controller.dart';
import 'package:go_connect/utils/log_print.dart';

class AddCarLocationController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDays = <DateTime>[].obs;

  var city = ''.obs;
  var pickupPoint = ''.obs;

  List<int> years = List.generate(11, (i) => 2025 + i);
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  void onMonthChanged(int month) {
    selectedMonth = month;
    focusedDay.value = DateTime(selectedYear, selectedMonth, 1);
    update();
  }

  void onYearChanged(int year) {
    selectedYear = year;
    focusedDay.value = DateTime(selectedYear, selectedMonth, 1);
    update();
  }

  void onDaySelected(DateTime day, DateTime focus) {
    focusedDay.value = focus;
    if (selectedDays.any((d) => isSameDay(d, day))) {
      selectedDays.removeWhere((d) => isSameDay(d, day));
    } else {
      selectedDays.add(day);
    }
    update();
  }

  void onPageChanged(DateTime focus) {
    focusedDay.value = focus;
    selectedMonth = focus.month;
    selectedYear = focus.year;
    update();
  }

  bool isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

  String monthName(int m) {
    const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return months[m - 1];
  }

  bool get isValid => city.value.isNotEmpty && pickupPoint.value.isNotEmpty && selectedDays.isNotEmpty;

  void nextPage() {
    try {
      Get.put(AddCarController()).nextPage();
    } catch (e) {
      errorLog("nextPage", e);
    }
  }

  void backButton() {
    try {
      Get.put(AddCarController()).backButton();
    } catch (e) {
      errorLog("nextPage", e);
    }
  }
}
