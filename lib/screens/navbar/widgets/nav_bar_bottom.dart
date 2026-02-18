import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/utils/app_size.dart';

class NavBarBottom extends StatelessWidget {
  const NavBarBottom({super.key, required this.icons, required this.selectedIndex, required this.onTap});
  final List<String> icons;
  final int selectedIndex;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.width(value: 70),
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return Expanded(
            child: NavBarGenItem(icons: icons, selectedIndex: selectedIndex, onTap: onTap, index: index),
          );
        }),
      ),
    );
  }
}

class NavBarGenItem extends StatelessWidget {
  const NavBarGenItem({super.key, required this.icons, required this.selectedIndex, required this.onTap, required this.index});
  final List<String> icons;
  final int selectedIndex;
  final int index;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            curve: Curves.decelerate,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(color: (selectedIndex == index) ? ConstColor.tabButtonColour : Colors.transparent, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: SvgPicture.asset(
                icons[index],
                width: AppSize.size.width * 0.07,
                height: AppSize.size.width * 0.07,
                colorFilter: ColorFilter.mode(selectedIndex == index ? Colors.black : Colors.grey, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        onTap(index);
      },
    );
  }
}
