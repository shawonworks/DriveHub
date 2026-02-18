// upload_photo_verification_screen.dart
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/host_screen/upload_photo_verification_screen/controller/upload_photo_verification_controller.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../utils/gap.dart';

class UploadPhotoVerificationScreen extends StatelessWidget {
  const UploadPhotoVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadPhotoVerificationController>(
      init: UploadPhotoVerificationController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.verification),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(AppSize.width(value: 20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(height: 20),

                /////////////////ID Card/////////////////
                _buildSectionTitle(ConstString.uploadPhotoIDCard),
                Gap(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionSide(ConstString.frontSide),
                    Gap(height: 6),
                    _buildUploadBox(
                      controller.idFront,
                          () => controller.showPickerOptions(
                        controller.pickIdFront,
                            () => controller.pickIdFront(),
                      ),
                    ),
                    Gap(height: 16),
                    _buildSectionSide(ConstString.backSide),
                    Gap(height: 6),
                    _buildUploadBox(
                      controller.idBack,
                          () => controller.showPickerOptions(
                        controller.pickIdBack,
                            () => controller.pickIdBack(),
                      ),
                    ),
                  ],
                ),

                Gap(height: 40),

                //////////////Driving License////////////////
                _buildSectionTitle(ConstString.uploadDrivingLicenceIfAny),
                Gap(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionSide(ConstString.frontSide),
                    Gap(height: 6),
                    _buildUploadBox(
                      controller.licenseFront,
                          () => controller.showPickerOptions(
                        controller.pickLicenseFront,
                            () => controller.pickLicenseFront(),
                      ),
                    ),
                    Gap(height: 16),
                    _buildSectionSide(ConstString.backSide),
                    Gap(height: 6),
                    _buildUploadBox(
                      controller.licenseBack,
                          () => controller.showPickerOptions(
                        controller.pickLicenseBack,
                            () => controller.pickLicenseBack(),
                      ),
                    ),
                  ],
                ),

                Gap(height: 30),

                CustomElevatedButton(
                  onPressed: () => controller.submit(),
                  child: Text(
                    ConstString.submit,
                    style: TextStyle(color: ConstColor.white, fontSize: AppSize.width(value: 20)),
                  ),
                ),

                Gap(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: AppSize.width(value: 8),
          height: AppSize.height(value: 20),
          decoration: BoxDecoration(color: ConstColor.black, shape: BoxShape.circle),
        ),
        Gap(width: 8),
        Text(title, style: TextStyle(fontSize: AppSize.width(value: 18), fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildSectionSide(String title) {
    return Text(title, style: TextStyle(fontSize: AppSize.width(value: 12), color: ConstColor.black));
  }

  Widget _buildUploadBox(Rx<File?> imageFile, VoidCallback onTap) {
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
                  radius: AppSize.width(value: 30),
                  backgroundColor: ConstColor.grey,
                  child: SvgPicture.asset(
                    ConstIcons.uploadIcon,
                    color: ConstColor.white,
                    width: AppSize.width(value: 24),
                    height: AppSize.width(value: 24),
                  ),
                ),
                Gap(height: 8),
                Text(
                  ConstString.uploadImage,
                  style: TextStyle(color: ConstColor.blue, fontSize: AppSize.width(value: 12)),
                ),
              ],
            )
                : ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.width(value: 10)),
              child: Image.file(
                imageFile.value!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ),
    );
  }
}