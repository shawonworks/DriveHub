import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/constant/image_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/buttons/app_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';
import 'package:go_connect/utils/storage_service.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
          child: Column(
            children: [
              AppImage(path: ImageString.logo, width: AppSize.size.width * 0.4),
              Gap(height: 20),
              AppImage(
                width: AppSize.size.width,
                path: ImageString.onBoardScreen,
              ),
              Gap(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(value: 20),
                ),
                child: CustomText(
                  title: ConstString.aSmarterWayToShareEarnAndMove,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  textSize: AppSize.width(value: 20),
                ),
              ),
              Gap(height: 20),

              // AppButton(
              //   onTap: () {
              //     Get.offAllNamed(AppRoutes.signInPage);
              //   },
              //   title: "Sign In",
              //   radius: 30,
              //   titleColor: ConstColor.white,
              // ),
              // Gap(height: 20),
              AppButton(
                onTap: () async {
                  await AppStorage().setRole("user");
                  final value = await AppStorage().getRole();
                  print("value : 😂😂😂😂😂$value");
                  Get.offAllNamed(AppRoutes.createAccountPage);
                },
                title: "Sign Up to Rent to Car",
                radius: 30,
                titleColor: ConstColor.white,
              ),

              Gap(height: 20),
              AppButton(
                onTap: () async {
                  await AppStorage().setRole("host");
                  final value = await AppStorage().getRole();
                  print("value : 😂😂😂😂😂$value");
                  Get.offAllNamed(AppRoutes.createAccountPage);
                },
                // title: "Sign Up Become a host",
                title: "Sign Up Become a host/partner",
                radius: 30,
                titleColor: ConstColor.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: ConstString.alreadyHaveAnAccount,
                    top: 13,
                    textColor: ConstColor.cardBorderColour,
                    textSize: AppSize.width(value: 12),
                    fontWeight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.signInPage);
                    },
                    child: CustomText(
                      title: ConstString.signIn,
                      top: 13,
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w500,
                      textColor: ConstColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
