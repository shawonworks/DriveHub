import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/custom_form_field_for_number_input.dart';
import 'package:go_connect/screens/auth_screens/signIn/controllers/signIn_controller.dart';
import 'package:go_connect/custom_widgets/authTopDisplay.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

import '../../../utils/storage_service.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GetBuilder(
      init: SigninController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: bottomButtons(controller: controller, formKey: formKey),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 16.0)),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthTopDisplay(title: ConstString.welcomeBackTitle, subTitile: ConstString.signInToContinueSubtitle),
                  CustomFormFieldForNumberInput(
                    onChangeCountry: (countrySelect) {
                      controller.selectedCountry.value = countrySelect;
                    },
                    hintText: CustomText(title: ConstString.phoneNumber, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),
                    textController: controller.signInEmailTextController,

                    fromTitle: ConstString.phoneNumber,
                  ),
                  // CustomTextFormField(
                  //   hintText: CustomText(title: ConstString.emailAddress, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                  //   textController: controller.signInEmailTextController,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return ConstString.pleaseEnterEmail;
                  //     }
                  //     if (!value.contains('@') || !value.contains('.')) {
                  //       return ConstString.pleaseEnterAValidEmailAddress;
                  //     }
                  //     return null;
                  //   },
                  //   fromTitle: ConstString.phoneNumber,
                  // ),
                  CustomTextFormField(
                    hintText: CustomText(title: ConstString.password, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                    textController: controller.signInPasswordTextController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ConstString.pleaseEnterPassword;
                      }
                      return null;
                    },
                    fromTitle: ConstString.password,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.forGetPasswordPage),
                        child: CustomText(
                          top: 10,
                          title: '${ConstString.forgetPasswordTitle}?',
                          textSize: AppSize.width(value: 10),
                          fontWeight: FontWeight.w400,
                          textColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomButtons({required SigninController controller, required GlobalKey<FormState> formKey}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 55.0),
      child: SizedBox(
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  child: CustomText(title: ConstString.signIn, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w400, textColor: Colors.white),
                  onPressed: () {
                    controller.signIn(formKey);
                    //   final value=await AppStorage().getValue(StorageKey.role);
                    //   print("values : 😂😂😂😂😂$value");
                    //   final role=await AppStorage().getValue(StorageKey.role);
                    //   print("role : 😂😂😂😂😂$role");
                    //   if(AppStorage().getRole()=="user"){
                    //     Get.toNamed(AppRoutes.navbar);
                    //   }
                    //   else
                    //   {
                    //     Get.toNamed(AppRoutes.hostNavBar);
                    //   }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(title: ConstString.dontHaveAnAccount, textColor: ConstColor.silverGray20, top: 13, textSize: 12, fontWeight: FontWeight.w500),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.createAccountPage);
                      },
                      child: CustomText(title: ConstString.createAccount, top: 13, textSize: 12, fontWeight: FontWeight.w500, textColor: ConstColor.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
