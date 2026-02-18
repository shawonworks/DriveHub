import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/const_color.dart';
import 'controller/host_booking_controller.dart';

class HostBookingPage extends StatelessWidget {
  HostBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HostBookingController>(
      init: HostBookingController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            foregroundColor: Colors.white,
            toolbarHeight: 4,

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(controller.filterList.length, (index) {
                      bool isSelected = controller.selectedIndex == index;

                      return GestureDetector(
                        onTap: () => controller.selectIndex(index),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, bottom: 5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: isSelected ? ConstColor.textColor : Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: isSelected ? ConstColor.textColor : ConstColor.silverGray20,
                                width: 1.5,
                              ),
                            ),
                            child: Text(

                              controller.filterList[index],
                              style: TextStyle(
                                color: isSelected ? Colors.white : ConstColor.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          // -------------------------------------------------------------

          body: controller.tapScreen[controller.selectedIndex],
        );
      },
    );
  }
}







