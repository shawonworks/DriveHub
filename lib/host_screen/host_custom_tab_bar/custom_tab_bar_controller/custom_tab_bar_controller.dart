import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/utils/log_print.dart';

class CustomTabBarController extends GetxController {
  //////////////////Mock filter list////////////////
  List<String> tabList = [ConstString.all, ConstString.upcoming, ConstString.ongoing, ConstString.completed, ConstString.cancelled];

  int selectedIndex = 0;


  void getQuestGiverSeeRequestList() {
    appLog("Selected filter: ${tabList[selectedIndex]}");
  }

  //////////////////UpdateUI////////////////
  void selectIndex(int index) {
    selectedIndex = index;
    getQuestGiverSeeRequestList();
    update();
  }
}
