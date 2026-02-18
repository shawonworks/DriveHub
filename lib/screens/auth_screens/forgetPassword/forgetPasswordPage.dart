import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/auth_screens/forgetPassword/controllers/forgetPasswordController.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/authAppbarBackButton.dart';
import 'package:go_connect/custom_widgets/authTopDisplay.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class Forgetpasswordpage extends StatelessWidget {
  const Forgetpasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Forgetpasswordcontroller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: AuthAppBarBackButton(),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: controller.forgotpassValidKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTopDisplay(title: ConstString.forgetPasswordTitle, subTitile: ConstString.aboutUs),
                  CustomTextFormField(
                    hintText: CustomText(title: ConstString.emailAddress, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                    textController: controller.forgotpassEmailConttroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ConstString.pleaseEnterEmail;
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return ConstString.pleaseEnterAValidEmailAddress;
                      }
                      return null;
                    },
                    fromTitle: ConstString.email,
                  ),
                  _bottomButton(controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding _bottomButton(Forgetpasswordcontroller controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55, top: 10),
      child: Wrap(
        children: [
          CustomElevatedButton(
            child: CustomText(
              title: ConstString.continueButton,
              textSize: AppSize.width(value: 18),
              fontWeight: FontWeight.w400,
              textColor: Colors.white,
            ),
            onPressed: () {
              if (controller.forgotpassValidKey.currentState!.validate()) {
                Get.toNamed(AppRoutes.forGetPasswordOtPage, arguments: controller.forgotpassEmailConttroller.text);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(title: ConstString.backTo, fontWeight: FontWeight.w400, top: 19, textSize: AppSize.width(value: 12)),
              GestureDetector(
                onTap: () => Get.offAllNamed(AppRoutes.signInPage),
                child: CustomText(
                  title: ConstString.logIn,
                  fontWeight: FontWeight.w400,
                  textSize: AppSize.width(value: 12),
                  top: 19,
                  textColor: ConstColor.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
