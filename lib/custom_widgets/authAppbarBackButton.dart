import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthAppBarBackButton extends StatelessWidget {
  const AuthAppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Get.back,
      child: Icon(Icons.arrow_back_rounded),
    );
  }
}
