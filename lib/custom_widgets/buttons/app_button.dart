import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.height,
    this.width,
    this.alignment,
    this.child,
    this.decoration,
    this.onTap,
    this.padding,
    this.title,
    this.isLoading = false,
    this.loaderColor,
    this.margin,
    this.backgroundColor,
    this.loadingSize,
    this.titleColor,
    this.border,
    this.borderColor,
    this.fontSize,
    this.borderRadius,
    this.fontWeight,
    this.radius = 5.0,
  });
  final double? loadingSize;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Decoration? decoration;
  final Widget? child;
  final String? title;
  final void Function()? onTap;
  final bool isLoading;
  final Color? titleColor;
  final Color? loaderColor;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Color? borderColor;
  final double? fontSize;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        duration: Durations.long1,
        curve: Curves.ease,
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        margin: margin,
        padding: padding ?? EdgeInsets.all(AppSize.width(value: 12.0)),
        decoration:
            decoration ??
            BoxDecoration(
              color: backgroundColor ?? ConstColor.primaryColor,
              border: border ?? Border.all(color: borderColor ?? ConstColor.primaryColor),
              borderRadius: borderRadius ?? BorderRadius.circular(AppSize.width(value: AppSize.width(value: radius))),
            ),
        child: isLoading
            ? SizedBox(
                width: loadingSize ?? AppSize.size.height * 0.03,
                height: loadingSize ?? AppSize.size.height * 0.03,
                child: CircularProgressIndicator(color: loaderColor ?? ConstColor.primaryColor),
              )
            : child ??
                  CustomText(
                    title: title ?? "",
                    textColor: titleColor ?? ConstColor.textColor,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    textSize: fontSize ?? 20,
                  ),
      ),
    );
  }
}
