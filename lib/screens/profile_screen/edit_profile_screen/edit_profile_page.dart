import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/screens/profile_screen/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:go_connect/utils/app_size.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditProfileController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.editProfile),
          bottomNavigationBar: CustomElevatedButton(
            right: 12,
            left: 12,
            bottom: 42,
            child: CustomText(
              title: ConstString.update,
              textSize: AppSize.width(value: 18),
              fontWeight: FontWeight.w400,
              textColor: Colors.white,
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              if (controller.createAccountValidKey.currentState!.validate()) {
                Get.back();
              }
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Form(
                key: controller.createAccountValidKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: AppSize.width(value: 35)),
                    Stack(
                      children: [
                        AppImageCircular(path: 'assets/images/car.png', height: AppSize.width(value: 140), width: AppSize.width(value: 140)),
                        Positioned(right: -1, bottom: -1, child: SvgPicture.asset(ConstIcons.cameraIcon)),
                      ],
                    ),
                    CustomText(
                      top: AppSize.width(value: 10),
                      title: 'Samuel Johnson',
                      textSize: AppSize.width(value: 26),
                      fontWeight: FontWeight.w500,
                    ),

                    CustomTextFormField(
                      fromTitle: ConstString.fullName,
                      textController: controller.nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ConstString.pleaseEnterYourName;
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      fromTitle: ConstString.phoneNumber,
                      textController: controller.phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ConstString.pleaseEnterYourphone;
                        }
                        return null;
                      },
                      numeric: true,
                    ),
                    CustomTextFormField(
                      fromTitle: ConstString.email,
                      textController: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return ConstString.pleaseEnterEmail;
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return ConstString.pleaseEnterAValidEmailAddress;
                        }
                        return null;
                      },
                    ),
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
