import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/custom_widgets/log_out_pop_up.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/screens/navbar/controller/navbar_controller.dart';
import 'package:go_connect/utils/app_role.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/log_print.dart';

void switchUser() {
  try {
    if (selectedUserRole == AppUserType.user) {
      selectedUserRole = AppUserType.host;
    } else {
      selectedUserRole = AppUserType.host;
    }
    Get.back();
    Get.put(NavbarController()).onAppInitial();
    Get.put(NavbarController()).update();
  } catch (e) {
    errorLog("switchUser", e);
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      ConstIcons.editProfileInformation,
      // ConstIcons.switchIntoHost,
      ConstIcons.chooseLanguage,
      ConstIcons.reSubmitKYC,
      ConstIcons.favorites,
      ConstIcons.password,
      ConstIcons.aboutUs,
      ConstIcons.termsAndConditions,
      ConstIcons.faq,
      ConstIcons.deleteAccount,
    ];
    List<String> itemsText = [
      ConstString.editProfileInformation,
      // ConstString.switchIntoHost,
      ConstString.chooseLanguage,
      ConstString.accountVerification,
      ConstString.favorites,
      ConstString.password,
      ConstString.aboutUs,
      ConstString.termsAndConditions,
      ConstString.faq,
      ConstString.deleteAccount,
    ];

    List<String> pages = [
      AppRoutes.editProfilePage,
      AppRoutes.chooseLanguagePage,
      AppRoutes.reSubmitKycPage,
      AppRoutes.favoritesPage,
      AppRoutes.passwordPage,
      AppRoutes.aboutUsPage,
      AppRoutes.termsConditionsPage,
      AppRoutes.faqPage,
      AppRoutes.deleteAccountPage,
    ];

    return Material(
      child: Scaffold(
        appBar: appBarBlankWithBackButton(ConstString.profile),
        bottomNavigationBar: LogOutOptions(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.width(value: 15)),
            AppImageCircular(path: 'assets/images/car.png', height: AppSize.width(value: 90), width: AppSize.width(value: 90)),
            CustomText(top: AppSize.width(value: 10), title: 'Samuel Johnson', textSize: AppSize.width(value: 26), fontWeight: FontWeight.w500),
            InkWell(
              onTap: () {
                switchUser();
              },
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              child: CustomText(
                top: 2,
                bottom: AppSize.width(value: 15),
                title: selectedUserRole == AppUserType.user ? ConstString.switchIntoHost : ConstString.switchIntoUser,
                textColor: ConstColor.primaryColor,
                textSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w500,
              ),
            ),
            // SizedBox(height: AppSize.width(value: 2)),
            ...List.generate(icons.length, (index) {
              final page = pages[index];
              return InkWell(
                onTap: () => Get.toNamed(page),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 10.69), horizontal: AppSize.width(value: 24)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(icons[index], height: AppSize.width(value: 16.62), width: AppSize.width(value: 16.62)),
                      SizedBox(width: AppSize.width(value: 9.05)),
                      CustomText(title: itemsText[index], textSize: AppSize.width(value: 15), fontWeight: FontWeight.w500),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class LogOutOptions extends StatelessWidget {
  const LogOutOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.width(value: 100),
      child: InkWell(
        onTap: () {
          logOutPopUp(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSize.width(value: 11.69), horizontal: AppSize.width(value: 24)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ConstIcons.logOut, height: AppSize.width(value: 16.62), width: AppSize.width(value: 16.62)),
              SizedBox(width: AppSize.width(value: 9.05)),
              CustomText(title: ConstString.logOut, textColor: Colors.red, textSize: AppSize.width(value: 15), fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ),
    );
  }
}
