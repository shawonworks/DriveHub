// lib/host_screen/cars_host_screen/Widget/show_custom_success_dialog.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

import '../../../utils/gap.dart';

void showCustomSuccessDialog({
  required String title,
  bool showCloseButton = true,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.width(value: 8))),
      elevation: 1,
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.width(value: 380),
        height: AppSize.height(value: 370),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.width(value: 8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showCloseButton)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: ConstColor.black, size: AppSize.width(value: 24)),
                  onPressed: () => Get.back(),
                ),
              )
            else
              Gap(height: 16,),

            Padding(
              padding: EdgeInsets.only(
                right: AppSize.width(value: 18),
                left: AppSize.width(value: 18),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppSize.width(value: 16),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            Gap(height: 16,),

            //////////////Continue Button///////////////////
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.uploadPhotoVerificationScreen);
              },
              left: AppSize.width(value: 40),
              right: AppSize.width(value: 40),
              top: AppSize.height(value: 35),
              height: AppSize.height(value: 48),
              child: Text(
                ConstString.continueButton,
                style: TextStyle(
                  color: ConstColor.white,
                  fontSize: AppSize.width(value: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}