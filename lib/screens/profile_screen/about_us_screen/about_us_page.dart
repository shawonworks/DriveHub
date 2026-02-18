import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title =
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).  Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.aboutUs),
      body: CustomText(top: 20, right: 12, left: 18, title: title, fontWeight: FontWeight.w400, textSize: 16, maxLine: 500),
    );
  }
}
