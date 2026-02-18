import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class RequestBookingMapCard extends StatelessWidget {
  const RequestBookingMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 5)),
            child: CustomText(
              textSize: 20,
              fontWeight: FontWeight.w600,
              title: ConstString.location, //AppString.location,
            ),
          ),
          SizedBox(height: AppSize.width(value: 10)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(title: "12b, Lekki Phase 1, Lagos, Nigeria", textSize: 14, fontWeight: FontWeight.w500),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffFFEEBD),
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 1, spreadRadius: 1)],
                  ),
                  child: CustomText(
                    textSize: 12,
                    fontWeight: FontWeight.w400,
                    title: '2.2 km away', //controller.distance.toString(), //"2.3 km away",
                    textColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Gap(height: 20),

          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Container(
              height: AppSize.size.width * 0.4,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 6))],
              ),
              clipBehavior: Clip.hardEdge,

              child: AppImage(path: "assets/temp/location_map.png", width: AppSize.size.width, height: AppSize.size.width * 0.4),
            ),
          ),
        ],
      ),
    );
  }
}
