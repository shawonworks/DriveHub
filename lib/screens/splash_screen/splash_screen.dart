import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/screens/splash_screen/controller/splash_screen_controller.dart';
import 'package:go_connect/utils/app_size.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () => Center(
              child: AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: controller.animation.value,
                child: AnimatedScale(
                  scale: controller.animation.value,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOutExpo,
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.width(value: 10)),
                    child: AppImage(path: "assets/images/logo.png"),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
