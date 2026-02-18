import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/screens/short_by_screen/controller/short_by_controller.dart';
import 'package:go_connect/utils/app_size.dart';

class ShortByPage extends StatelessWidget {
  const ShortByPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ShortByController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.sortBy),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 32),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.sortOptions.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => controller.setIndexNumber(index),
                    child: SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            title: controller.sortOptions[index],
                            textSize: AppSize.width(value: 18),
                            fontWeight: FontWeight.w500,
                          ),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: controller.selectedIndex == index
                                ? Colors.black
                                : Colors.grey,
                            child: Icon(
                              size: 18,
                              Icons.check_sharp,
                              color: controller.selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
