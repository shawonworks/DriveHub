import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/custom_widgets/buttons/app_button.dart';
import 'package:go_connect/custom_widgets/buttons/custom_check_box_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/screens/request_booking_screen/controller/request_booking_screen_controller.dart';
import 'package:go_connect/screens/request_booking_screen/widgets/request_booking_accepted_dialog.dart';
import 'package:go_connect/screens/request_booking_screen/widgets/request_booking_details_card.dart';
import 'package:go_connect/screens/request_booking_screen/widgets/request_booking_drop_off_date_build_widget.dart';
import 'package:go_connect/screens/request_booking_screen/widgets/request_booking_map_card.dart';
import 'package:go_connect/screens/request_booking_screen/widgets/request_booking_pick_up_date_build_widget.dart';
import 'package:go_connect/screens/request_booking_screen/widgets/request_booking_type_vehicle_info.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class RequestBookingScreen extends StatelessWidget {
  const RequestBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RequestBookingScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: CustomText(title: "Booking", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
          ),

          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
            children: [
              RequestBookingTypeVehicleInfo(),
              Row(
                children: [
                  Expanded(
                    child: CustomText(title: "Choose Time", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
                  ),
                  Icon(Icons.expand_more, fontWeight: FontWeight.bold, size: AppSize.width(value: 25)),
                ],
              ),
              Gap(height: 5),
              Obx(
                () => RequestBookingPickUpDateBuildWidget(
                  date: controller.pickUpDate.value,
                  time: controller.pickUpTime.value,
                  onDateSelected: controller.formatePickUpData,
                  onTimeSelected: controller.formatePickUpTime,
                ),
              ),
              Gap(height: 8),
              Obx(
                () => RequestBookingDropOffDateBuildWidget(
                  date: controller.dropOffDate.value,
                  time: controller.dropOfTime.value,
                  onDateSelected: controller.formateDropDate,
                  onTimeSelected: controller.formateDropTime,
                ),
              ),

              RequestBookingMapCard(),
              RequestBookingDetailsCard(),
              Gap(height: 30),
              Row(
                children: [
                  Obx(
                    () => CustomCheckBoxButton(
                      value: controller.isAgreeTermsAndCondition.value,
                      onChange: (value) {
                        controller.isAgreeTermsAndCondition.value = value;
                      },
                    ),
                  ),
                  Gap(width: 5),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "I have read and agree to the "),
                          TextSpan(text: " terms and conditions "),
                        ],
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Gap(height: 15),
              Obx(
                () => AppButton(
                  onTap: () {
                    if (controller.isAgreeTermsAndCondition.value) {
                      callBookingAcceptedDialog();
                    }
                  },
                  borderColor: controller.isAgreeTermsAndCondition.value ? ConstColor.primaryColor : ConstColor.tabButtonColour,
                  backgroundColor: controller.isAgreeTermsAndCondition.value ? ConstColor.primaryColor : ConstColor.tabButtonColour,
                  title: "Request A Book",
                  padding: EdgeInsets.all(AppSize.width(value: 10)),
                  titleColor: Colors.white,
                  radius: 20,
                ),
              ),
              Gap(height: 100),
            ],
          ),
        );
      },
    );
  }
}
