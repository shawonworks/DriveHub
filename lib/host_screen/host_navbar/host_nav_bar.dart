import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/host_screen/host_navbar/widgets/host_nav_bar_bottom.dart';
import 'package:go_connect/utils/app_size.dart';

import '../../custom_widgets/host_custom_app_bar/host_main_app_bar.dart';
import 'controller/host_navbar_controller.dart';

class HostNavBar extends StatelessWidget {
  const HostNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HostNavbarController(),
      builder: (controller) {
        return Scaffold(
          ////////////////Main AppBAr/////////////
          appBar: HostMainAppBar(),

          ////////////////Main BottomNavBar/////////////
          bottomNavigationBar: HostNavBarBottom(onTap: controller.onTapValueChange, icons: controller.icons, selectedIndex: controller.selectedIndex.value),
          ////////////////Body/////////////
          body: IndexedStack(index: controller.selectedIndex.value, children: controller.pages),
        );
      },
    );
  }
}

class SearchEngine extends StatelessWidget {
  const SearchEngine({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {},
      cursorColor: ConstColor.primaryColor,
      maxLines: 1,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.all(AppSize.width(value: 10)),
          child: SvgPicture.asset('assets/icons/searchIcon.svg', height: AppSize.height(value: 18), width: AppSize.width(value: 18)),
        ),
        hintMaxLines: 1,
        hintStyle: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'poppins'),
        hintText: 'Search',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
