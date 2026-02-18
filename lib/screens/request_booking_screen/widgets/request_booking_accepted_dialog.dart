import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

void callBookingAcceptedDialog() {
  Get.dialog(_BookingAcceptedDialog());
}

class _BookingAcceptedDialog extends StatelessWidget {
  const _BookingAcceptedDialog();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        child: Center(
          child: Container(
            width: AppSize.size.width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 15), vertical: AppSize.width(value: 10)),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppSize.width(value: 10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.close, weight: 100, fontWeight: FontWeight.bold),
                ),
                Align(
                  child: AppImage(path: "assets/images/checked.png", width: AppSize.width(value: 60), height: AppSize.width(value: 60)),
                ),
                Gap(height: 5),
                CustomText(title: "Booking Accepted", textColor: Colors.black, fontWeight: FontWeight.w600, textSize: AppSize.width(value: 25)),
                Gap(height: 5),
                CustomText(
                  maxLine: 10,
                  textAlign: TextAlign.center,
                  title:
                      "You’ve successfully accepted the booking for Liam on July 25, 2025, 9:00 AM - 1:00 PM. You are now scheduled to care for him on that day.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
