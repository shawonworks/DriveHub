import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/constant/dev_image_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';

class HostCarCard extends StatelessWidget {
  final String status;
  final void Function()? onTap;

  const HostCarCard({
    super.key,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    String buttonText;

    if (status == "Requested") {
      buttonColor = Colors.orange;
      buttonText = "Pending";
    } else if (status == "Active") {
      buttonColor = Colors.green;
      buttonText = "Active";
    } else {
      buttonColor = Colors.red;
      buttonText = "Cancelled";
    }

    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: ConstColor.cardBorderColour),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(6),
                  child: AppImage(
                    path: DevImageString.hostCar,
                    height: AppSize.width(value: 170),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                CustomText(
                  title: ConstString.revueltoaV12hybridsupercar,
                  textSize: AppSize.width(value: 21),
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    CustomText(
                      title: '5.0 ⭐ ',
                      textSize: AppSize.width(value: 13),
                      fontWeight: FontWeight.w400,
                    ),
                    CustomText(
                      title: ConstString.trips15,
                      textSize: AppSize.width(value: 13),
                      fontWeight: FontWeight.w400,
                    ),
                    SvgPicture.asset(ConstIcons.carsIcon),
                    CustomText(
                      title: ConstString.withDriver,
                      textSize: AppSize.width(value: 13),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(ConstIcons.locationIcon),
                      CustomText(
                        left: 5,
                        title: ConstString.santaAna,
                        textSize: AppSize.width(value: 11),
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        title: ' • ',
                        textSize: AppSize.width(value: 11),
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        title: ConstString.miles325,
                        textSize: AppSize.width(value: 11),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(ConstIcons.greenDotIcon),
                      CustomText(
                        left: 5,
                        title: ConstString.sep1113Sept,
                        textSize: AppSize.width(value: 11),
                        fontWeight: FontWeight.w400,
                      ),
                      Spacer(),
                      CustomText(
                        title: ConstString.cFADay25000F,
                        textSize: AppSize.width(value: 15),
                        textColor: ConstColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}