import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/host_screen/host_custom_tab_bar/custom_tab_bar_controller/custom_tab_bar_controller.dart';
import '../../constant/const_color.dart';

class HostCustomTabBar extends StatelessWidget {
  const HostCustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomTabBarController>(
      init: CustomTabBarController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                children: List.generate(controller.tabList.length, (index) {
                  var data = controller.tabList[index];
                  bool isSelected = controller.selectedIndex == index;
                  return GestureDetector(
                    onTap: () => controller.selectIndex(index),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? ConstColor.textColor : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: isSelected ? ConstColor.textColor : ConstColor.silverGray20,
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            data,
                            style: TextStyle(
                              color: isSelected ? Colors.white : ConstColor.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}