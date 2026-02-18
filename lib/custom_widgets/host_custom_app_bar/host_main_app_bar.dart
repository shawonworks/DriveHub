import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/constant/dev_image_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class HostMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HostMainAppBar({super.key});

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
                  child: AppImageCircular(path: DevImageString.hostProfile, width: AppSize.width(value: 50), height: AppSize.width(value: 50)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(textSize: AppSize.width(value: 20), fontWeight: FontWeight.bold, textColor: ConstColor.black, title: ConstString.samuelDoe),
                    // const SizedBox(height: 2,),
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutes.myLocationUpdateScreen),
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(ConstIcons.locationIcon, width: 12),
                          const SizedBox(width: 5),
                          CustomText(textSize: 14, fontWeight: FontWeight.bold, textColor: ConstColor.textColor, title: ConstString.california),
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
  Size get preferredSize => const Size.fromHeight(90); // set custom height
}
