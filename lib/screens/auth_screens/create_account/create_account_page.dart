import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/custom_form_field_for_number_input.dart';
import 'package:go_connect/screens/auth_screens/create_account/controllers/create_account_controller.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/authTopDisplay.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GetBuilder(
      init: CreateAccountController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: bottomButtons(controller: controller, formKey: formKey),
          appBar: AppBar(leading: SizedBox(), shadowColor: Colors.transparent, surfaceTintColor: Colors.transparent, backgroundColor: Colors.transparent),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTopDisplay(title: ConstString.welcomeBackTitle, subTitile: ConstString.signUpToContinueSubtitle),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            hintText: CustomText(title: ConstString.fullName, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                            textController: controller.firstNameTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ConstString.pleaseEnterYourName;
                              }
                              return null;
                            },
                            fromTitle: ConstString.firstNameLabel,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: CustomTextFormField(
                            hintText: CustomText(title: ConstString.fullName, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                            textController: controller.lastNameTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ConstString.pleaseEnterYourName;
                              }
                              return null;
                            },
                            fromTitle: ConstString.lastNameLabel,
                          ),
                        ),
                      ],
                    ),
                    CustomFormFieldForNumberInput(
                      onChangeCountry: (countrySelect) {
                        controller.selectedCountry.value = countrySelect;
                      },
                      hintText: CustomText(title: ConstString.phoneNumber, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),
                      textController: controller.emailTextController,

                      fromTitle: ConstString.phoneNumber,
                    ),
                    CustomTextFormField(
                      hintText: CustomText(title: ConstString.phoneNumber, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),

                      textController: controller.passwordTextController,
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

                      textController: controller.confirmPasswordTextController,
                      validator: (value) {
                        if (controller.passwordTextController.value.text != controller.confirmPasswordTextController.value.text) {
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bottomButtons({required CreateAccountController controller, required GlobalKey<FormState> formKey}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 55.0),
      child: SizedBox(
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  child: CustomText(title: ConstString.signUp, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w400, textColor: Colors.white),
                  onPressed: () {
                    controller.createAccount(formKey);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      title: ConstString.alreadyHaveAnAccount,
                      top: 13,
                      textColor: ConstColor.cardBorderColour,
                      textSize: AppSize.width(value: 12),
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.signInPage);
                      },
                      child: CustomText(title: ConstString.signIn, top: 13, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w500, textColor: ConstColor.primaryColor),
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




// Togo, Benin, cote d'voire, niger USA