import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';

class AuthTopDisplay extends StatelessWidget {
  final String title;
  final String subTitile;
  const AuthTopDisplay({super.key, required this.title, required this.subTitile});
  @override
  Widget build(BuildContext context) {
    // bool isLight = Theme.of(context).brightness == Brightness.dark; // Unused
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11.54, right: 11.54, bottom: 8, top: 30),

            child: CustomText(title: title, textColor: ConstColor.textColor, textSize: AppSize.width(value: 28), fontWeight: FontWeight.w600),
          ),

          CustomText(
            title: subTitile,
            textColor: ConstColor.textColor,
            textSize: AppSize.width(value: 16),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            maxLine: 4,
          ),
          SizedBox(height: 27),
        ],
      ),
    );
  }
}
