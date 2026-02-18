import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/car_card.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/screens/owner_details/controller/owner_details_controller.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class OwnerDetailsPage extends StatelessWidget {
  const OwnerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OwnerDetailsController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.ownerDetails),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppImageCircular(height: AppSize.size.width * 0.3, width: AppSize.size.width * 0.3, path: 'assets/temp/profile.png'),
                  CustomText(title: 'Samuel', fontWeight: FontWeight.w700, textSize: AppSize.width(value: 28)),
                  CustomText(bottom: 5, title: '5.0 ⭐', fontWeight: FontWeight.w400, textSize: AppSize.width(value: 18)),
                  CustomText(bottom: AppSize.width(value: 10), title: 'Joined 15 Jan 2025', fontWeight: FontWeight.w400, textSize: 12),
                  Container(height: 1, color: ConstColor.cardBorderColour, width: double.infinity),
                  Row(
                    children: [CustomText(top: 10, title: ConstString.verifiedInfo, fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20))],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.verifiedInfoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(title: controller.verifiedInfoList[index], fontWeight: FontWeight.w500, textSize: AppSize.width(value: 16)),

                            Icon(Icons.check_circle_rounded, color: ConstColor.primaryColor),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(margin: EdgeInsets.only(top: 10), height: 1, color: ConstColor.cardBorderColour, width: double.infinity),
                  Row(
                    children: [
                      CustomText(top: 10, bottom: 7, title: ConstString.vehicles, fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
                    ],
                  ),
                  CarCard(
                    onTap: () {
                      Get.toNamed(AppRoutes.carDetailsPage);
                    },
                  ),
                  Container(margin: EdgeInsets.only(top: 40), height: 1, color: ConstColor.cardBorderColour, width: double.infinity),

                  Map(),
                  Gap(height: 100),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 6))],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: ConstColor.cardBorderColour),
        ),
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
                  CustomText(
                    title: "12b, Lekki Phase 1, Lagos, Nigeria",
                    textSize: 14,
                    fontWeight: FontWeight.w500,
                    // controller.singleBookingById?.parentId.address ??
                    // 'N/A', //"12b, Lekki Phase 1, Lagos, Nigeria",
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ConstColor.textColor),
                    child: CustomText(
                      textSize: 12,
                      fontWeight: FontWeight.w400,
                      title: '2.2 km away', //controller.distance.toString(), //"2.3 km away",
                      textColor: Colors.white,
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
                width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 6))],
                ),
                clipBehavior: Clip.hardEdge,
                // child: Image.asset('assets/images/car.png', width: double.infinity, height: double.infinity, fit: BoxFit.cover),
                child: AppImage(path: "assets/temp/location_map.png", width: AppSize.size.width, height: AppSize.size.width * 0.4),

                //  Obx(
                //   () => GoogleMap(
                //     onMapCreated: controller.onMapCreated,
                //     initialCameraPosition: CameraPosition(
                //       target: controller.currentPosition.value,
                //       zoom: 15,
                //     ),
                //     markers: controller.markers.toSet(),
                //     zoomControlsEnabled: true,
                //     mapToolbarEnabled: false,
                //     myLocationButtonEnabled: false,
                //     myLocationEnabled: true,
                //     mapType: MapType.normal,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
