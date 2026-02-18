// lib/widgets/custom_tab_bar.dart
import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/utils/app_size.dart';

class CustomTabBar extends StatefulWidget {
  final List<Widget> pages;
  const CustomTabBar({super.key, required this.pages});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppSize.height(value: 36),
          width: double.infinity,
          //padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCategory(ConstString.requested, 0),
              buildCategory(ConstString.active, 1),
              buildCategory(ConstString.cancelled, 2),
            ],
          ),
        ),

        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: widget.pages,
          ),
        ),
      ],
    );
  }

  Widget buildCategory(String text, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.width(value: 18),
          vertical: AppSize.height(value: 5),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ConstColor.grey),
          color: isSelected ? ConstColor.black : ConstColor.white,
          borderRadius: BorderRadius.circular(AppSize.width(value: 100)),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: AppSize.width(value: 6),
                offset: Offset(0, AppSize.height(value: 3)),
              ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? ConstColor.white : Colors.black87,
            fontSize: AppSize.width(value: 16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}