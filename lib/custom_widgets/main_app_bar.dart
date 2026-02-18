import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.toNamed(AppRoutes.profilePage),
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  // child: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/images/car.png')),
                  child: AppImageCircular(path: "assets/temp/profile.png", width: AppSize.width(value: 24), height: AppSize.width(value: 24)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textSize: AppSize.width(value: 20),
                      fontWeight: FontWeight.w600,
                      textColor: ConstColor.primaryColor,
                      title: "Hi,Samuel!",
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutes.myLocationUpdateScreen),
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      child: Row(
                        children: [
                          CustomText(textSize: 13, fontWeight: FontWeight.w400, textColor: ConstColor.textColor, title: "Dugbe, Ibadan"),
                          const Icon(Icons.keyboard_arrow_down, color: ConstColor.textColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(onTap: () => Get.toNamed(AppRoutes.notifications), child: SvgPicture.asset(ConstIcons.notificationIcon, height: 24, width: 24)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72); // set custom height
}
