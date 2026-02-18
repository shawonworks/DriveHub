import 'package:get/get.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_info_tab_bar/add_car_info_tab_bar_controller/add_car_info_tab_bar_controller.dart';
import 'package:go_connect/utils/log_print.dart';

class AddCarPricingController extends GetxController {
  var isWithDriver = true.obs;

  var dailyPrice = ''.obs;
  var minimumTripDuration = ''.obs;

  void selectWithDriver(bool value) {
    isWithDriver.value = value;
    update();
  }

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

  bool get isValid => dailyPrice.value.isNotEmpty && minimumTripDuration.value.isNotEmpty;

  void printAllData() {
    print("Daily Price: ${dailyPrice.value}");
    print("Minimum Trip Duration: ${minimumTripDuration.value}");
    print("With Driver: ${isWithDriver.value}");
  }
}
