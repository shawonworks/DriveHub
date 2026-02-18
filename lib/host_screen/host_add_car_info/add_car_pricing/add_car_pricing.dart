// lib/host_screen/host_add_car_info/add_car_pricing/add_car_pricing.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/constant/dev_image_string.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../../utils/gap.dart';
import 'add_car_pricing_controller/add_car_pricing_controller.dart';

class AddCarPricing extends StatelessWidget {
  const AddCarPricing({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarPricingController>(
      init: AddCarPricingController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(AppSize.width(value: 20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ConstString.pricing,
                  style: TextStyle(fontSize: AppSize.width(value: 20), fontWeight: FontWeight.bold),
                ),
                Text(
                  ConstString.setYourRentalPricingAndOptions,
                  style: TextStyle(fontSize: AppSize.width(value: 14), color: ConstColor.grey),
                ),

                Gap(height: 12),

                Text(
                  ConstString.dailyPrice,
                  style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: AppSize.height(value: 8)),
                CustomTextFormField(
                  onChanged: (value) => controller.dailyPrice.value = value,
                  hintText: Text("0", style: TextStyle(fontSize: AppSize.width(value: 14))),
                  suffixText: ConstString.backTo,
                ),

                Gap(height: 22),

                Text(
                  ConstString.minimumTripDuration,
                  style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                ),
                Gap(height: 8),
                CustomTextFormField(onChanged: (value) => controller.minimumTripDuration.value = value),

                Gap(height: 22),

                Text(
                  ConstString.withDriver,
                  style: TextStyle(fontSize: AppSize.width(value: 14), fontWeight: FontWeight.bold),
                ),
                Gap(height: 12),

                /////////////With Driver / Without Driver///////////////////
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () => controller.selectWithDriver(true),
                        child: Container(
                          width: AppSize.width(value: 160),
                          height: AppSize.height(value: 56),
                          decoration: BoxDecoration(
                            color: controller.isWithDriver.value ? ConstColor.primaryColor : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(AppSize.width(value: 8))),
                            border: Border.all(color: controller.isWithDriver.value ? ConstColor.primaryColor : ConstColor.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(DevImageString.driver),
                              Gap(width: 10),
                              Text(
                                ConstString.withDriver,
                                style: TextStyle(
                                  color: controller.isWithDriver.value ? Colors.white : ConstColor.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppSize.width(value: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Obx(
                      () => InkWell(
                        onTap: () => controller.selectWithDriver(false),
                        child: Container(
                          width: AppSize.width(value: 160),
                          height: AppSize.height(value: 56),
                          decoration: BoxDecoration(
                            color: controller.isWithDriver.value ? Colors.white : ConstColor.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(AppSize.width(value: 8))),
                            border: Border.all(color: controller.isWithDriver.value ? ConstColor.grey : ConstColor.primaryColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(DevImageString.locationImg),
                              Gap(width: 10),
                              Text(
                                ConstString.withoutDriver,
                                style: TextStyle(
                                  color: controller.isWithDriver.value ? ConstColor.grey : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppSize.width(value: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Spacer(),

                ///////////////Previous + Next Button//////////////////////
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
                        ConstString.previous,
                        style: TextStyle(fontSize: AppSize.width(value: 20), color: ConstColor.grey),
                      ),
                    ),
                    CustomElevatedButton(
                      // onPressed: controller.isValid
                      //     ? () {
                      //   controller.printAllData();
                      //   Get.snackbar("Success", "Pricing saved!", backgroundColor: Colors.green);
                      // }
                      //     : null,
                      onPressed: () {
                        controller.nextPage();
                      },
                      width: AppSize.width(value: 160),
                      height: AppSize.height(value: 56),
                      child: Text(
                        ConstString.next,
                        style: TextStyle(fontSize: AppSize.width(value: 20), color: ConstColor.white),
                      ),
                    ),
                  ],
                ),

                Gap(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
