import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/auth_screens/resetPassword/controllers/resetPasswordController.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/authAppbarBackButton.dart';
import 'package:go_connect/custom_widgets/authTopDisplay.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class Resetpasswordpage extends StatelessWidget {
  const Resetpasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Resetpasswordcontroller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: AuthAppBarBackButton(),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: controller.resetpassValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTopDisplay(title: ConstString.newPasswordTitle, subTitile: ConstString.setANewPasswordSubtitle),
                    CustomTextFormField(
                      hintText: CustomText(title: ConstString.password, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                      textController: controller.resetpassPasswordConttroller,
                      validator: (value) {
                        if (value!.length < 7) {
                          return ConstString.pleaseEnterPasswordAtLeast8Digit;
                        }
                        if (!value.contains('!') && !value.contains('@') && !value.contains('#') && !value.contains('\$')) {
                          return ConstString.pleaseUseSpecialCharsInPassword;
                        }
                        if (value.isEmpty) {
                          return ConstString.pleaseEnterPassword;
                        }
                        return null;
                      },
                      fromTitle: ConstString.setPassword,
                    ),
                    CustomTextFormField(
                      hintText: CustomText(title: ConstString.confirmPassword, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                      textController: controller.resetConfirmPassEmailConttroller,
                      validator: (value) {
                        if (controller.resetpassPasswordConttroller.value.text != controller.resetConfirmPassEmailConttroller.value.text) {
                          return ConstString.bothPasswordDoesNotMatch;
                        }
                        if (value!.length < 7) {
                          return ConstString.pleaseEnterPasswordAtLeast8Digit;
                        }
                        if (!value.contains('!') && !value.contains('@') && !value.contains('#') && !value.contains('\$')) {
                          return ConstString.pleaseUseSpecialCharsInPassword;
                        }
                        if (value.isEmpty) {
                          return ConstString.pleaseEnterPassword;
                        }
                        return null;
                      },
                      fromTitle: ConstString.confirmPassword,
                    ),
                    _bottomButton(controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Padding _bottomButton(Resetpasswordcontroller controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 55, top: 23),
      child: CustomElevatedButton(
        child: CustomText(title: ConstString.update, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w400, textColor: Colors.white),
        onPressed: () {
          if (controller.resetpassValidKey.currentState!.validate()) {
            Get.offAllNamed(AppRoutes.signInPage);
          }
        },
      ),
    );
  }
}
