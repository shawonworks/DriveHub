import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';

AppBar appBarBlankWithBackButton(String title) {
  return AppBar(
    centerTitle: true,
    title: CustomText(title: title, fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_rounded)),
  );
}
