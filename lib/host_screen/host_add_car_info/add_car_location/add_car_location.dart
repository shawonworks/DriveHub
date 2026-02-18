// lib/host_screen/host_add_car_info/add_car_location/add_car_location.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../../utils/gap.dart';
import 'Widget/date_calender.dart';
import 'add_car_location_controller/add_car_location_controller.dart';
import 'package:go_connect/routes/app_routes.dart';

class AddCarLocation extends StatelessWidget {
  const AddCarLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarLocationController>(
      init: AddCarLocationController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSize.width(value: 20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ConstString.locationAvailability,
                    style: TextStyle(fontSize: AppSize.width(value: 20), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ConstString.whereAndWhenIsYourCarAvailable,
                    style: TextStyle(fontSize: AppSize.width(value: 14), color: ConstColor.grey),
                  ),
                  Gap(height: 12),

                  Text(
                    ConstString.city,
                    style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                  ),
                  Gap(height: 8),
                  CustomTextFormField(
                    hintText: Text(ConstString.egSaFranciscoLosAngeles, style: TextStyle(color: ConstColor.grey)),
                    suffixText: ConstString.backTo,
                  ),

                  Gap(height: 22),

                  Text(
                    ConstString.pickupPoint,
                    style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                  ),
                  Gap(height: 8),
                  CustomTextFormField(
                    hintText: Text(ConstString.egSaFranciscoLosAngeles, style: TextStyle(color: ConstColor.grey)),
                  ),

                  Gap(height: 22),

                  Text(
                    ConstString.availableDates,
                    style: TextStyle(fontSize: AppSize.width(value: 14), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: AppSize.height(value: 12)),

                  AvailableDateCalendar(),

                  Gap(height: 12),

                  //////////////////Warning Card////////////////
                  Card(
                    elevation: 4.0,
                    color: ConstColor.yellow,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.width(value: 12))),
                    child: Padding(
                      padding: EdgeInsets.all(AppSize.width(value: 16)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ConstIcons.warningIcon),
                          SizedBox(width: AppSize.width(value: 10)),
                          Expanded(
                            child: Text(
                              ConstString.yourCarWillBeReviewedWithin2448hoursYouLl,
                              style: TextStyle(fontSize: AppSize.width(value: 12)),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Gap(height: 15),

                  ///////////////Back + Submit Button///////////////
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        onPressed: () {
                          controller.backButton();
                        },
                        width: AppSize.width(value: 160),
                        height: AppSize.height(value: 56),
                        color: ConstColor.white,
                        child: Text(
                          ConstString.back,
                          style: TextStyle(fontSize: AppSize.width(value: 20), color: ConstColor.grey),
                        ),
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.navbar);
                        },
                        width: AppSize.width(value: 160),
                        height: AppSize.height(value: 56),
                        child: Text(
                          ConstString.submit,
                          style: TextStyle(fontSize: AppSize.width(value: 20), color: ConstColor.white),
                        ),
                      ),
                    ],
                  ),

                  Gap(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
