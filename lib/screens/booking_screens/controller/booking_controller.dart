import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/utils/log_print.dart';

class BookingController extends GetxController {
  // Mock filter list
  List<String> filterList = [ConstString.all, ConstString.upcoming, ConstString.ongoing, ConstString.completed, ConstString.cancelled];

  // Track selected index
  int selectedIndex = 0;

  // This function can later be used to call API
  void getQuestGiverSeeRequestList() {
    // For now, just print the selected filter
    appLog("Selected filter: ${filterList[selectedIndex]}");
  }

  // Update selected index and refresh UI
  void selectIndex(int index) {
    selectedIndex = index;
    getQuestGiverSeeRequestList();
    update(); // triggers GetBuilder to rebuild
  }
}
