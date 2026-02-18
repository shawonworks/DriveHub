import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_connect/host_screen/chart_screen/dashboard_Screen.dart';
import 'package:go_connect/host_screen/host_booking_screen/host_booking_card.dart';
import 'package:go_connect/host_screen/host_booking_screen/widget/cancelled_page.dart';
import 'package:go_connect/host_screen/host_booking_screen/widget/completed_page.dart';
import 'package:go_connect/host_screen/host_booking_screen/widget/upcomig_Page.dart';

import '../../../constant/const_string.dart';
import '../../../utils/log_print.dart';
import '../widget/ongoing_page.dart';

class HostBookingController extends GetxController{
  List<String> filterList = [ConstString.upcoming, ConstString.ongoing, ConstString.completed, ConstString.cancelled];

  List<Widget> tapScreen =[UpcomigPage(),OngoingPage(),CompletedPage(),CancelledPage()];

 
  int selectedIndex = 1;

  


  void getQuestGiverSeeRequestList() {

    appLog("Selected filter: ${filterList[selectedIndex]}");
  }


  void selectIndex(int index) {
    selectedIndex = index;
    getQuestGiverSeeRequestList();
    update();
  }
}