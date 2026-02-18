import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ConstColor.cardBorderColour),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(6),
              child: AppImage(path: 'assets/temp/car.png', height: AppSize.width(value: 170), width: double.infinity, fit: BoxFit.cover),
            ),
            CustomText(title: 'Revuelto (a V12 hybrid supercar)', textSize: AppSize.width(value: 21), fontWeight: FontWeight.w600),
            Row(
              children: [
                CustomText(title: '5.0 ⭐ ', textSize: AppSize.width(value: 13), fontWeight: FontWeight.w400),
                CustomText(title: '(15 Trips) ', textSize: AppSize.width(value: 13), fontWeight: FontWeight.w400),
                SvgPicture.asset(ConstIcons.carsIcon),
                CustomText(title: ' With Driver', textSize: AppSize.width(value: 13), fontWeight: FontWeight.w400),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  SvgPicture.asset(ConstIcons.locationIcon),
                  CustomText(left: 5, title: 'Santa Ana', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                  CustomText(title: ' • ', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                  CustomText(title: '32.5 miles', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Row(
                children: [
                  SvgPicture.asset(ConstIcons.greenDotIcon),
                  CustomText(left: 5, title: 'Available', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                  Spacer(),
                  CustomText(
                    title: '25000F CFA/Day',
                    textSize: AppSize.width(value: 15),
                    textColor: ConstColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
