import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/app_snack_bar/app_snack_bar.dart';
import 'package:go_connect/custom_widgets/buttons/app_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class MyLocationUpdateScreen extends StatelessWidget {
  const MyLocationUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(title: "Location", fontWeight: FontWeight.w700, textSize: AppSize.width(value: 20)),
      ),
      bottomNavigationBar: SafeArea(
        child: AppButton(
          onTap: () {
            Get.back();
          },
          height: AppSize.width(value: 50),
          radius: 25,
          title: "Confirm Location",
          titleColor: ConstColor.white,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
        child: Column(
          children: [
            CustomTextFormField(
              prefixIcon: Center(child: Icon(Icons.search)),
              prefixIconConstraints: BoxConstraints(maxWidth: AppSize.width(value: 40)),
              hintText: CustomText(title: "Search your location"),
            ),
            Gap(height: 20),
            InkWell(
              onTap: () {
                AppSnackBar.message("Not Implement yet");
              },
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 10)),
                decoration: BoxDecoration(
                  border: Border.all(color: ConstColor.textColor),
                  borderRadius: BorderRadius.circular(AppSize.width(value: 20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.my_location),
                    Gap(width: 10),
                    CustomText(title: "Use Current Location", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 18)),
                  ],
                ),
              ),
            ),
            Gap(height: 20),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(AppSize.width(value: 5)),
              child: AppImage(path: "assets/temp/location_map.png", width: AppSize.size.width, height: AppSize.size.width * 0.5),
            ),
            Gap(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: CustomText(title: "California, USA", fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
