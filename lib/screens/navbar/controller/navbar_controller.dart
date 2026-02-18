import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/host_screen/cars_host_screen/cars_host_screen.dart';
import 'package:go_connect/host_screen/chart_screen/dashboard_Screen.dart';
import 'package:go_connect/host_screen/host_booking_screen/host_booking_page.dart';
import 'package:go_connect/host_screen/host_chat_screen/host_chat_page.dart';
import 'package:go_connect/screens/booking_screens/booking_page.dart';
import 'package:go_connect/screens/chat_screen/chat_page.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/screens/home_screen/home_page.dart';
import 'package:go_connect/screens/search_screen/controller/search_page_controller.dart';
import 'package:go_connect/screens/search_screen/search_page.dart';
import 'package:go_connect/utils/app_role.dart';
import 'package:go_connect/utils/log_print.dart';

class NavbarController extends GetxController {
  List<String> icons = [];

  List<Widget> pages = [];

  RxInt selectedIndex = 0.obs;

  void onTapValueChange(int index) {
    try {
      selectedIndex.value = index;
      update();
    } catch (e) {
      errorLog("onTapValueChange", e);
    }
  }

  void searchDestinationNavButton() {
    try {
      selectedIndex.value = 1;
      update();
      Future.delayed(Durations.medium4, () {
        Get.put(SearchPageController()).requestFocusNode();
      });
    } catch (e) {
      errorLog("message", e);
    }
  }

  void onAppInitial() {
    pages = selectedUserRole == AppUserType.user
        ? [SearchPage(), HomePage(navbarController: this), ChatPage(), BookingPage()]
        : pages = [CarsHostScreen(), DashboardScreen(), HostChatPage(), HostBookingPage()];
    icons = selectedUserRole == AppUserType.user
        ? [ConstIcons.searchTabIcon, ConstIcons.homeTabIcon, ConstIcons.chatTabIcon, ConstIcons.bookmarksTabIcon]
        : [ConstIcons.runCarIcon, ConstIcons.chartTabIcon, ConstIcons.chatTabIcon, ConstIcons.bookmarksTabIcon];
  }

  @override
  void onInit() {
    onAppInitial();
    super.onInit();
  }
}
