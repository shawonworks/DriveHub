// lib/custom_widgets/custom_form_field.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';

import '../constant/const_color.dart';
import '../utils/app_size.dart';

class CustomTextFormField extends StatelessWidget {
  final bool numeric;
  final String fromTitle;
  final Widget? hintText;
  final int maxLine;
  final int? minLines;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final double? borderRadius;
  final BoxConstraints? prefixIconConstraints;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? suffixText;
  final Color? suffixTextColor;

  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    super.key,
    this.fromTitle = "",
    this.numeric = false,
    this.hintText,
    this.maxLine = 1,
    this.minLines,
    this.backgroundColor,
    this.textController,
    this.validator,
    this.prefixIcon,
    this.borderRadius,
    this.prefixIconConstraints,
    this.textInputAction,
    this.focusNode,
    this.keyboardType,
    this.suffixText,
    this.suffixTextColor,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fromTitle == ''
              ? SizedBox.shrink()
              : CustomText(
                  top: 0,
                  bottom: 2,
                  title: fromTitle,
                  textSize: AppSize.width(value: 16),
                  fontWeight: FontWeight.w600,
                ),

          TextFormField(
            style: TextStyle(
              color: ConstColor.textColor,
              fontSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
              decorationThickness: 0,
            ),
            focusNode: focusNode,
            validator:
                validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return "This field is required";
                  }
                  return null;
                },
            controller: textController,
            minLines: minLines,
            maxLines: maxLine,
            textInputAction: textInputAction ?? TextInputAction.done,
            keyboardType:
                keyboardType ?? (numeric ? TextInputType.number : null),
            cursorColor: ConstColor.primaryColor,

            onChanged: onChanged,

            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              prefixIconConstraints: prefixIconConstraints,
              suffixText: suffixText,
              suffixStyle: TextStyle(
                color: suffixTextColor ?? ConstColor.grey,
                fontSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w500,
              ),

              filled: backgroundColor != null,
              fillColor: backgroundColor,
              hoverColor: ConstColor.primaryColor,
              hintStyle: TextStyle(
                color: ConstColor.cardBorderColour,
                fontSize: AppSize.width(value: 12),
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              hint: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ConstColor.cardBorderColour),
                borderRadius: BorderRadius.circular(borderRadius ?? 100),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ConstColor.cardBorderColour),
                borderRadius: BorderRadius.circular(borderRadius ?? 100),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(borderRadius ?? 100),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 100),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 100),
              ),
              errorStyle: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
