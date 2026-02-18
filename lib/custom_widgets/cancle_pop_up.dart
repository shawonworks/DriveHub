import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';

Future<void> canclePopUp(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Dialog(
          backgroundColor: Colors.white, // dark background
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 246,
                  child: CustomText(
                    textAlign: TextAlign.center,
                    title: ConstString.areYouSureCancle,
                    textColor: ConstColor.textColor,
                    fontWeight: FontWeight.w500,
                    textSize: 16,
                  ),
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [_noButton(context), SizedBox(width: 12), _yesButton(context)]),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _yesButton(BuildContext context) {
  return SizedBox(
    height: 30,
    child: ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(width: 1, color: Colors.red),
        ),
      ),
      child: CustomText(title: ConstString.yes, textColor: Colors.red, fontWeight: FontWeight.w400, textSize: 14),
      // ),
    ),
  );
}

Widget _noButton(BuildContext context) {
  return SizedBox(
    height: 30,
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: CustomText(title: ConstString.no, textColor: Colors.white, fontWeight: FontWeight.w400, textSize: 14),
      // ),
    ),
  );
}
