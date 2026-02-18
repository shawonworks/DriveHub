import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/screens/cars_screens/controller/car_screen_controller.dart';
import 'package:go_connect/utils/app_size.dart';

AppBar carHeaderWidget({required String title, required CarScreenController controller}) {
  return AppBar(
    centerTitle: true,
    title: CustomText(title: title, fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_rounded)),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight / 2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => CustomText(title: controller.selectedDropdown.value, fontWeight: FontWeight.bold)),
            PopupMenuButton(
              icon: SvgPicture.asset(ConstIcons.filterIcon),
              position: PopupMenuPosition.under,
              color: Colors.white,
              onSelected: (value) {
                controller.selectedDropdown.value = value;
              },
              itemBuilder: (context) {
                return List.generate(controller.dropdownVAlue.length, (index) {
                  var item = controller.dropdownVAlue[index];
                  return PopupMenuItem(
                    value: item,
                    child: CustomText(title: item),
                  );
                });
              },
            ),
          ],
        ),
      ),
    ),
  );
}
