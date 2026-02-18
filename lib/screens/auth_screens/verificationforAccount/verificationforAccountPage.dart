import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/auth_screens/forgetPasswordOTP/controllers/forgetPasswordOTPController.dart';
import 'package:go_connect/custom_widgets/authTopDisplay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/authAppbarBackButton.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class Verificationforaccountpage extends StatelessWidget {
  const Verificationforaccountpage({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmailAddress = Get.arguments;
    return GetBuilder(
      init: Forgetpasswordotpcontroller(),
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
                key: controller.frgtPassOTPValidKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthTopDisplay(
                      title: ConstString.verification,
                      subTitile: '${ConstString.sentVerificationCode}   \n${userEmailAddress ?? 'No Email ID Inserted'}',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          bottom: 10,
                          title: ConstString.code,
                          textSize: AppSize.width(value: 18),
                          fontWeight: FontWeight.w600,
                          textColor: ConstColor.textColor,
                          top: 8,
                        ),
                      ],
                    ),
                    // CustomText(
                    //   title:
                    //       userEmailAddress ??
                    //       'No Email ID Inserted', //AppStorage().getEmailID(),
                    //   textSize: AppSize.width(value: 12),
                    //   fontWeight: FontWeight.w500,
                    //   textColor: ConstColor.textColor,
                    //   bottom: 22,
                    // ),
                    PinCodeTextField(
                      validator: (value) {
                        if (controller.frgtPassPinCodeController.text.length < 6) {
                          return ConstString.enterFull6DigitOTP;
                        }
                        if (controller.frgtPassPinCodeController.value.text.isEmpty) {
                          return ConstString.invalidOTP;
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                      keyboardType: TextInputType.number,
                      cursorColor: ConstColor.textColor,
                      controller: controller.frgtPassPinCodeController,
                      appContext: context,
                      length: 6,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(100),
                        fieldHeight: 55,
                        fieldWidth: AppSize.width(value: 50),
                        borderWidth: 1.0,
                        inactiveColor: ConstColor.cardBorderColour,
                        selectedColor: ConstColor.cardBorderColour,
                        activeColor: ConstColor.cardBorderColour,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          title: ConstString.resend,
                          textSize: AppSize.width(value: 11),
                          fontWeight: FontWeight.w400,
                          textColor: ConstColor.primaryColor,
                        ),
                        CustomText(title: ConstString.codeAgain, textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                      ],
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

  Padding _bottomButton(Forgetpasswordotpcontroller controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      child: CustomElevatedButton(
        child: CustomText(title: ConstString.verify, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w400, textColor: Colors.white),
        onPressed: () {
          if (controller.frgtPassOTPValidKey.currentState!.validate()) {
            Get.offAllNamed(AppRoutes.signInPage);
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_connect/auth_screens/verificationforAccount/controllers/verificationforAccountController.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:go_connect/constant/const_colour.dart';
// import 'package:go_connect/constant/const_string.dart';
// import 'package:go_connect/custom_widget/authAppbarBackButton.dart';
// import 'package:go_connect/custom_widget/custom_elevated_button.dart';
// import 'package:go_connect/custom_widget/custom_text.dart';
// import 'package:go_connect/routes/app_routes.dart';
// import 'package:go_connect/utils/appSize.dart';

// class Verificationforaccountpage extends StatelessWidget {
//   const Verificationforaccountpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: Verificationforaccountcontroller(),
//       builder: (controller) {
//         return Scaffold(
//           bottomNavigationBar: BottomButton(controller: controller),
//           appBar: AppBar(leading: AuthAppBarBackButton()),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Form(
//                 key: controller.varificationValidKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       title: ConstString.verifyAccount,
//                       textSize: AppSize.width(value: 22), //22,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     CustomText(
//                       title: ConstString.enter6DigitCode,
//                       textSize: AppSize.width(value: 10),
//                       fontWeight: FontWeight.w500,
//                       textColor: Colors.white,
//                       top: 8,
//                       bottom: 22,
//                     ),
//                     PinCodeTextField(
//                       validator: (value) {
//                         if (controller.varificationPinCodeController.text.length < 6) {
//                           return ConstString.enterFull6DigitOTP;
//                         }
//                         if (controller.varificationPinCodeController.value.text.isEmpty) {
//                           return ConstString.invalidOTP;
//                         }
//                         return null;
//                       },
//                       autovalidateMode: AutovalidateMode.disabled,
//                       keyboardType: TextInputType.number,
//                       cursorColor: ConstColor.primaryColor,
//                       controller: controller.varificationPinCodeController,
//                       appContext: context,
//                       length: 6,
//                       animationType: AnimationType.fade,
//                       pinTheme: PinTheme(
//                         shape: PinCodeFieldShape.box,
//                         borderRadius: BorderRadius.circular(12),
//                         fieldHeight: AppSize.height(value: 55),
//                         fieldWidth: AppSize.width(value: 50),
//                         borderWidth: 1.0,
//                         inactiveColor: Colors.white10,
//                         selectedColor: Colors.white54,
//                         activeColor: Colors.white54,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         CustomText(
//                           title: ConstString.resend,
//                           textSize: AppSize.width(value: 11),
//                           fontWeight: FontWeight.w400,
//                           textColor: ConstColor.primaryColor,
//                         ),
//                         CustomText(
//                           title: ConstString.codeAgain,
//                           textSize: AppSize.width(value: 11),
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class BottomButton extends StatelessWidget {
//   const BottomButton({super.key, required this.controller});

//   final Verificationforaccountcontroller controller;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 55, right: 16, left: 16.0),
//       child: CustomElevatedButton(
//         child: CustomText(
//           title: ConstString.verifyAccount,
//           textSize: AppSize.width(value: 12),
//           fontWeight: FontWeight.w400,
//           textColor: ConstColor.appDarktBackGround,
//         ),
//         onPressed: () {
//           if (controller.varificationValidKey.currentState!.validate()) {
//             Get.offAllNamed(AppRoutes.signinpage);
//           }
//         },
//       ),
//     );
//   }
// }
