// lib/host_screen/host_add_car_info/add_car_details/add_car_details.dart
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_details/add_car_details_controller/add_car_details_controller.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';
import '../../../constant/const_color.dart';
import '../../../constant/const_icons.dart';
import '../../../constant/const_string.dart';
import '../../../custom_widgets/custom_form_field.dart';

class AddCarDetails extends StatelessWidget {
  const AddCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GetBuilder<AddCarDetailsController>(
      init: AddCarDetailsController(),
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
                      ConstString.carDetails,
                      style: TextStyle(fontSize: AppSize.width(value: 20), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ConstString.provideadditionalinformationaboutyourcar,
                      style: TextStyle(fontSize: AppSize.width(value: 14), color: ConstColor.grey),
                    ),
                    Gap(height: 10),

                    //////////////////Car Color////////////////
                    Text(
                      ConstString.color,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      onChanged: (value) => controller.carColor.value = value,
                      hintText: Text(ConstString.egWhiteBlackSilver, style: TextStyle(color: ConstColor.grey)),
                    ),
                    Gap(height: 10),

                    //////////////////Short Description////////////////
                    Text(
                      ConstString.shortDescription,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    Gap(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                      maxLines: 5,
                      onChanged: (value) => controller.shortDescription.value = value,

                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppSize.width(value: 12))),
                        hintText: ConstString.describeyourcarsfeaturesconditionandanyspecialamenities,
                        hintStyle: TextStyle(color: ConstColor.grey),
                      ),
                    ),
                    Gap(height: 10),

                    //////////////////License Plate////////////////
                    Text(
                      ConstString.licensePlate,
                      style: TextStyle(fontSize: AppSize.width(value: 16), fontWeight: FontWeight.bold),
                    ),
                    CustomTextFormField(
                      onChanged: (value) => controller.licensePlate.value = value,
                      hintText: Text(ConstString.egABC1234, style: TextStyle(color: ConstColor.grey)),
                    ),
                    Gap(height: 10),

                    ////////////////////////Car Registration Paper Upload//////////////
                    Padding(
                      padding: EdgeInsets.all(AppSize.width(value: 20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("⬤", style: TextStyle(fontSize: 16)),
                              Gap(width: 12),
                              Text(
                                ConstString.carRegistrationPaper,
                                style: TextStyle(fontSize: AppSize.width(value: 22), fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Gap(height: 10),
                          registrationUpSide(ConstString.frontSide),
                          Gap(height: 6),
                          registrationUploadBox(controller.idFront, controller.pickIdFront),
                          Gap(height: 14),
                          registrationUpSide(ConstString.backSide),
                          Gap(height: 6),
                          registrationUploadBox(controller.idBack, controller.pickIdBack),
                        ],
                      ),
                    ),

                    ////////////////////Previous + Next Buttons///////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevatedButton(
                          onPressed: () {
                            controller.previousPage();
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
                          //         controller.printAllData();
                          //         Get.snackbar("Success", "All details saved!", backgroundColor: Colors.green);
                          //       }
                          //     : null,
                          onPressed: () {
                            controller.nextPage(formKey);
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

                    Gap(height: 50),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget registrationUpSide(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: AppSize.width(value: 12), color: ConstColor.black),
    );
  }

  Widget registrationUploadBox(Rx<File?> imageFile, VoidCallback onTap) {
    return Obx(
      () => GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          dashPattern: [4, 5],
          color: ConstColor.grey,
          strokeWidth: 1.5,
          borderType: BorderType.RRect,
          radius: Radius.circular(10),
          child: Container(
            alignment: Alignment.center,
            height: AppSize.height(value: 216),
            child: imageFile.value == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: ConstColor.grey,
                        child: SvgPicture.asset(ConstIcons.uploadIcon, color: ConstColor.white),
                      ),
                      SizedBox(height: AppSize.height(value: 8)),
                      Text(
                        ConstString.uploadImage,
                        style: TextStyle(color: ConstColor.blue, fontSize: AppSize.width(value: 12)),
                      ),
                    ],
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
                    child: Image.file(imageFile.value!, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
                  ),
          ),
        ),
      ),
    );
  }
}
