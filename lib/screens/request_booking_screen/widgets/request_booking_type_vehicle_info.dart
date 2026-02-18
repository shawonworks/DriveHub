import 'package:flutter/material.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class RequestBookingTypeVehicleInfo extends StatelessWidget {
  const RequestBookingTypeVehicleInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: "Booking Type", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
        Gap(height: 5),
        Container(
          decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(AppSize.width(value: 10))),
          padding: EdgeInsets.all(AppSize.width(value: 15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImage(width: AppSize.width(value: 25), height: AppSize.width(value: 25), path: "assets/icons/image 7.png"),
              CustomText(title: "With Driver", textColor: Colors.white, fontWeight: FontWeight.w500),
            ],
          ),
        ),
        Gap(height: 10),

        Row(
          children: [
            Expanded(
              child: CustomText(title: "Vehicle Type", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
            ),
            Expanded(
              child: CustomText(title: "Car", textAlign: TextAlign.end, fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
            ),
          ],
        ),
        Gap(height: 10),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(AppSize.width(value: 10)),
              child: AppImage(path: "assets/temp/car.png", width: AppSize.size.width * 0.25, height: AppSize.size.width * 0.2),
            ),
            Gap(width: 10),
            Expanded(
              child: Column(
                spacing: AppSize.width(value: 5),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: "Toyota Land Cruiser Prado"),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Flexible(child: CustomText(title: "California, USA")),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 5)),
                    decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(AppSize.width(value: 10))),
                    child: Row(
                      spacing: AppSize.width(value: 5),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: CustomText(title: "4", textColor: Colors.white),
                        ),
                        Icon(Icons.star_purple500_outlined, color: Colors.amber, size: AppSize.width(value: 15)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(height: 20),
      ],
    );
  }
}
