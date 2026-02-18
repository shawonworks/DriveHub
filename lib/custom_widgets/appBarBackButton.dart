import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Appbarbackbuttonfilled extends StatelessWidget {
  const Appbarbackbuttonfilled({super.key, required this.backGroundColor});
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.white, // foreground color
        size: 18, // adjust for padding within 34x34
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue), // background color
        fixedSize: WidgetStatePropertyAll(Size(34, 34)), // square size
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // circular radius 10
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.zero), // remove internal padding
      ),
    );
  }
}
