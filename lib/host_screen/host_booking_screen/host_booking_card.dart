import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constant/const_color.dart';
import '../../constant/const_icons.dart';
import '../../constant/const_string.dart';
import '../../custom_widgets/app_image/app_image.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/text/custom_text.dart';
import '../../screens/booking_details_screen/booking_details_page.dart';
import '../../utils/app_size.dart';

class HostBookingCard extends StatelessWidget {
  const HostBookingCard({super.key});

  void _openDialPad(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Could not launch dial pad");
    }
  }

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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: AppImage(
                    path:"assets/images/bookigcar.png",
                    height: AppSize.width(value: 170),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomText(
                      title: ConstString.checkedIn,
                      textSize: AppSize.width(value: 14),
                      textColor: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            CustomText(title: ConstString.revueltoaV12hybridsupercar, textSize: AppSize.width(value: 21), fontWeight: FontWeight.w600),

            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(left: 5, title:ConstString.guestJohnAnderson, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),
                  Spacer(),
                  CustomText(title:ConstString.total120, textSize: AppSize.width(value: 16), textColor: ConstColor.primaryColor, fontWeight: FontWeight.w600),
                ],
              ),
            ),
            // this is my booking info call =====================================>>>>>>>>>>>>>>>>>>>>>
            _BookingInfo(),
            SizedBox(height: 20,),

            // this one is call now button=================================================////////////////////////
            CustomElevatedButton(
              top: 0,
              bottom: 20,
              height: 56,
              elevation: 0,
              onPressed: () {
                _openDialPad("01619960331");
              },
              color: ConstColor.primaryColor,

              child: CustomText(title: ConstString.callNow, fontWeight: FontWeight.w400, textColor: Colors.white, textSize: AppSize.width(value: 18)),
            ),
            //=-===================================================

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
            CustomText(title: ConstString.from, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
            CustomText(title: ConstString.to, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12),),
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12), ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: ConstString.destination, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
            Row(
              children: [
                SvgPicture.asset(ConstIcons.locationIcon),
                CustomText(left: 5, title: ConstString.californiaUSA, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
