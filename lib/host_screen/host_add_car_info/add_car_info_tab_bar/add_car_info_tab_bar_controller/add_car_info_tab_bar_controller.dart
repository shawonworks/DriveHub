import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/utils/log_print.dart';

class AddCarController extends GetxController {
  PageController pageController = PageController();

  int currentStep = 0;

  void nextPage() {
    try {
      pageController.nextPage(duration: Durations.medium1, curve: Curves.easeInCubic);
    } catch (e) {
      errorLog("nextPage", e);
    }
  }

  void backButton() {
    try {
      var page = pageController.page;
      if (page == null) {
        return;
      }
      if (page > 0) {
        pageController.previousPage(duration: Durations.medium1, curve: Curves.easeInCubic);
      } else {
        Get.back();
      }
    } catch (e) {
      errorLog("backButton", e);
    }
  }

  void updateStep(int index) {
    currentStep = index;
    update();
  }

  void onAppInitial() {
    pageController = PageController();
  }

  void onAppClose() {
    pageController.dispose();
  }

  @override
  void onInit() {
    onAppInitial();
    super.onInit();
  }

  @override
  void onClose() {
    onAppClose();
    super.onClose();
  }
}
