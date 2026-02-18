import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/host_screen/host_add_car_info/car_basic_information/car_basic_information_controller/car_basic_information_controller.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class CarBasicInformation extends StatelessWidget {
  const CarBasicInformation({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GetBuilder<CarBasicInformationController>(
      init: CarBasicInformationController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppSize.width(value: 20)),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstString.basicInformation,
                      style: TextStyle(fontSize: AppSize.width(value: 20), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ConstString.tellUsAboutYourVehicle,
                      style: TextStyle(fontSize: AppSize.width(value: 14), color: ConstColor.grey),
                    ),
                    Gap(height: 10),

                    Text(
                      ConstString.brand,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      textController: TextEditingController()..text = controller.brand.value,
                      onChanged: (value) => controller.brand.value = value ?? '',
                      hintText: Text(ConstString.egToyotaHondaBMW, style: TextStyle(color: ConstColor.grey)),
                    ),

                    Gap(height: 10),
                    Text(
                      ConstString.model,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      textController: TextEditingController()..text = controller.model.value,
                      onChanged: (value) => controller.model.value = value ?? '',
                      hintText: Text(ConstString.egToyotaHondaBMW, style: TextStyle(color: ConstColor.grey)),
                    ),

                    Gap(height: 10),
                    Text(
                      ConstString.year,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      textController: TextEditingController()..text = controller.year.value,
                      onChanged: (value) => controller.year.value = value ?? '',
                      hintText: Text(ConstString.egToyotaHondaBMW, style: TextStyle(color: ConstColor.grey)),
                    ),

                    Gap(height: 10),
                    Text(
                      ConstString.transmission,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      textController: TextEditingController()..text = controller.transmission.value,
                      onChanged: (value) => controller.transmission.value = value ?? '',
                      hintText: Text(ConstString.selectTransmission, style: TextStyle(color: ConstColor.grey)),
                    ),

                    Gap(height: 10),
                    Text(
                      ConstString.fuelType,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      textController: TextEditingController()..text = controller.fuelType.value,
                      onChanged: (value) => controller.fuelType.value = value,
                      hintText: Text(ConstString.selectFuelType, style: TextStyle(color: ConstColor.grey)),
                    ),

                    Gap(height: 10),
                    Text(
                      ConstString.seatNumber,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      textController: TextEditingController()..text = controller.seatNumber.value,
                      onChanged: (value) => controller.seatNumber.value = value,
                      hintText: Text(ConstString.selectNumberOfSeat, style: TextStyle(color: ConstColor.grey)),
                    ),

                    Gap(height: 14),

                    CustomElevatedButton(
                      onPressed: () {
                        controller.nextButton(formKey);
                      },
                      // onPressed: controller.isValid
                      // ? () {
                      //     Get.snackbar("Success", "All data saved!", backgroundColor: Colors.green);
                      //     // Get.to(() => NextPage());
                      //   }
                      // : null,
                      child: Text(
                        ConstString.next,
                        style: TextStyle(color: ConstColor.white, fontSize: AppSize.width(value: 20)),
                      ),
                    ),

                    Gap(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
