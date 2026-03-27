import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/car_request_screen/controller/car_request_controller.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class CarRequestPage extends StatelessWidget {
  const CarRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.size = MediaQuery.of(context).size;
    return GetBuilder(
      init: CarRequestController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.booking),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  BookingType(),
                  VehicleType(),
                  Map(),
                  PaymentOption(controller: controller),
                  Details(),
                  TermsAndCoCheckerSubmitButton(controller: controller),
                  RequestABookButton(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RequestABookButton extends StatelessWidget {
  final CarRequestController controller;
  const RequestABookButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomElevatedButton(
        top: 0,
        bottom: 10,
        height: 56,
        elevation: 0,
        onPressed: () {
          if (controller.acceptedAgreement.value) {
            // Write the statement what we want to do
          }
        },
        color: controller.acceptedAgreement.value ? ConstColor.primaryColor : ConstColor.silverGray20,
        child: CustomText(title: ConstString.requestABook, fontWeight: FontWeight.w400, textColor: Colors.white, textSize: AppSize.width(value: 18)),
      );
    });
  }
}

class TermsAndCoCheckerSubmitButton extends StatelessWidget {
  final CarRequestController controller;
  const TermsAndCoCheckerSubmitButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return Checkbox(
            value: controller.acceptedAgreement.value,
            onChanged: (value) {
              if (value != null) {
                controller.acceptedAgreement.value = value;
              }
            },
          );
        }),

        Row(
          children: [
            CustomText(title: ConstString.iHaveReadandAgreeToThe),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.termsConditionsPage),
              child: CustomText(title: ConstString.termsAndConditions, textColor: ConstColor.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: ConstString.details, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w500, bottom: 3, top: 20),
        DetailsItem(headers: 'Car(With Driver):', info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.duration, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.dayRate, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.driverFee, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.totalCost, info: 'Amsterdam, Netherlands'),
      ],
    );
  }
}

class DetailsItem extends StatelessWidget {
  final String headers;
  final String info;
  const DetailsItem({super.key, required this.headers, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width(value: 115),
            child: CustomText(title: headers, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w500, textAlign: TextAlign.start),
          ),
          CustomText(title: info, maxLine: 20),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final CarRequestController controller;
  const PaymentOption({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: ConstString.paymentMethod, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w500),
        Obx(
          () => SizedBox(
            width: double.infinity,
            child: DropdownButton<String>(
              value: controller.selectedOption.value, // will be null initially
              hint: CustomText(title: ConstString.choosePaymentOption, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w400),
              items: const [
                DropdownMenuItem(value: 'option1', child: Text('Option 1')),
                DropdownMenuItem(value: 'option2', child: Text('Option 2')),
                DropdownMenuItem(value: 'option3', child: Text('Option 3')),
              ],
              onChanged: (value) {
                controller.selectedOption.value = value;
              },
            ),
          ),
        ),
      ],
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
            CustomText(
              textSize: 20,
              fontWeight: FontWeight.w600,
              title: ConstString.location, //AppString.location,
            ),

            SizedBox(height: AppSize.width(value: 5)),

            Row(
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
            SizedBox(height: AppSize.width(value: 6)),

            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                height: 200,
                width: double.infinity,
                // margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 6))],
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/images/car.png', width: double.infinity, height: double.infinity, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleType extends StatelessWidget {
  const VehicleType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(top: 23, bottom: 12.5, title: ConstString.vehicleType, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w500),
          ],
        ),

        SizedBox(
          height: 72,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(6),
                child: Image.asset('assets/images/car.png', width: 101, fit: BoxFit.cover),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: AppSize.size.width - 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      bottom: 2,
                      title: 'Toyota Land Cruiser Prado Toyota Land Cruiser Prado',
                      textSize: AppSize.width(value: 14),
                      fontWeight: FontWeight.w500,
                      maxLine: 1,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(ConstIcons.locationIcon),
                        CustomText(
                          left: 2,
                          bottom: 2,
                          title: 'California, USA',
                          textSize: AppSize.width(value: 12),
                          fontWeight: FontWeight.w400,
                          maxLine: 1,
                        ),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ConstColor.textColor),
                      child: CustomText(
                        textSize: 12,
                        fontWeight: FontWeight.w400,
                        title: '4  ⭐', //controller.distance.toString(), //"2.3 km away",
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BookingType extends StatelessWidget {
  const BookingType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [CustomText(title: ConstString.bookingType, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w500)],
        ),

        Container(
          decoration: BoxDecoration(color: ConstColor.textColor, borderRadius: BorderRadius.circular(9)),
          height: 65,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset('assets/icons/image 7.png')),
              CustomText(
                bottom: 2,
                // ignore: dead_code
                title: true ? ConstString.withDriver : ConstString.withOutDriver,
                textSize: AppSize.width(value: 14),
                fontWeight: FontWeight.w500,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
