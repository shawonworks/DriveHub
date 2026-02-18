import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/log_print.dart';

class SplashScreenController extends GetxController {
  RxDouble animation = 0.0.obs;

  Future<void> onAppInitialDataLoad() async {
    try {
      animation.value = 0;
      await Future.delayed(Durations.medium1);
      animation.value = 1;
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.onboardScreen);
      });
    } catch (e) {
      errorLog("onAppInitialDataLoad", e);
    }
  }

  @override
  void onInit() {
    onAppInitialDataLoad();
    super.onInit();
  }
}
