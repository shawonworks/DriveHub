import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/screens/profile_screen/choose_language_screen/controller/choose_language_contoller.dart';
import 'package:go_connect/utils/app_size.dart';

// Assuming LanguageController is in your project

class ChooseLanguagePage extends StatelessWidget {
  const ChooseLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseLanguageContoller>(
      init: ChooseLanguageContoller(),
      builder: (controller) {
        return Scaffold(
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
            onPressed: () {},
          ),
          appBar: appBarBlankWithBackButton(ConstString.language),
          body: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CustomText(
                    top: 20,
                    title: ConstString.pleasepSelectLanguage,
                    textSize: AppSize.width(value: 18),
                    fontWeight: FontWeight.w400,
                    textColor: ConstColor.textColor,
                    textAlign: TextAlign.center,
                  ),

                  // Text(
                  //   'Please select your preferred language to facilitate communication',
                  //   style: TextStyle(fontSize: 16.0, color: Colors.black54),
                  // ),
                ),
                // const Divider(height: 1, thickness: 1, color: Colors.grey),
                _buildLanguageOption(context, Language.english.language, Language.english.language, controller),
                // const Divider(height: 1, thickness: 1, color: Colors.grey),
                _buildLanguageOption(context, Language.french.language, Language.french.language, controller),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext context, String title, String value, ChooseLanguageContoller controller) {
    return InkWell(
      onTap: () => controller.selectLanguage(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              title: title,
              textSize: AppSize.width(value: 16),
              fontWeight: FontWeight.w600,
              textColor: controller.selectedLanguage.value == value ? Colors.teal : Colors.black,
            ),
            Radio<String>(
              value: value,
              groupValue: controller.selectedLanguage.value,
              activeColor: Colors.teal,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  controller.selectLanguage(newValue);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
