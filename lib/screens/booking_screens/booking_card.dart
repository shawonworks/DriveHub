import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/screens/booking_details_screen/booking_details_page.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSize.size.width - 130,
                  child: CustomText(
                    title: '${ConstString.bookingId} #BH-Car-10215',
                    textSize: AppSize.width(value: 16),
                    textColor: const Color.fromARGB(255, 0, 90, 163),
                    fontWeight: FontWeight.w500,
                    maxLine: 2,
                    bottom: 12,
                  ),
                ),
                Spacer(),
                CustomText(title: 'Ongoing', textSize: AppSize.width(value: 16), textColor: Colors.orangeAccent, fontWeight: FontWeight.w500),
              ],
            ),
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
                  SvgPicture.asset(ConstIcons.calendarIcon),
                  CustomText(left: 5, title: 'Sep 25-28', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                  Spacer(),
                  CustomText(title: '120/Total', textSize: AppSize.width(value: 16), textColor: ConstColor.primaryColor, fontWeight: FontWeight.w600),
                ],
              ),
            ),
            _BookingInfo(),


          ],
        ),
      ),
    );
  }
}

class _BookingInfo extends StatelessWidget {
  const _BookingInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DottedLineCustom(top: 12, bottom: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: ConstString.from, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
            CustomText(title: ConstString.to, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: ConstString.destination, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
            Row(
              children: [
                SvgPicture.asset(ConstIcons.locationIcon),
                CustomText(left: 5, title: 'California, USA', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
//
// class _BookingStatus extends StatelessWidget {
//   const _BookingStatus();
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: AppSize.size.width - 130,
//           child: CustomText(
//             title: '${ConstString.bookingId} #BH-Car-10215',
//             textSize: AppSize.width(value: 16),
//             textColor: const Color.fromARGB(255, 0, 90, 163),
//             fontWeight: FontWeight.w500,
//             maxLine: 2,
//             bottom: 12,
//           ),
//         ),
//         Spacer(),
//         CustomText(title: 'Ongoing', textSize: AppSize.width(value: 16), textColor: Colors.orangeAccent, fontWeight: FontWeight.w500),
//       ],
//     );
//   }
// }
