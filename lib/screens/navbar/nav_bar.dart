import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/custom_widgets/main_app_bar.dart';
import 'package:go_connect/screens/navbar/controller/navbar_controller.dart';
import 'package:go_connect/screens/navbar/widgets/nav_bar_bottom.dart';
import 'package:go_connect/utils/app_size.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavbarController(),
      builder: (controller) {
        return Scaffold(
          appBar: MainAppBar(),

          bottomNavigationBar: SafeArea(
            child: NavBarBottom(onTap: controller.onTapValueChange, icons: controller.icons, selectedIndex: controller.selectedIndex.value),
          ),
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
