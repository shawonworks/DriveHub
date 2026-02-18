import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_details/add_car_details.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_location/add_car_location.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_photos/add_car_photos.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_pricing/add_car_pricing.dart';
import 'package:go_connect/host_screen/host_add_car_info/car_basic_information/car_basic_information.dart';
import 'add_car_info_tab_bar_controller/add_car_info_tab_bar_controller.dart';

class AddCarPage extends StatelessWidget {
  AddCarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(
      init: AddCarController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(ConstString.addaCar),
            centerTitle: true,
            leading: BackButton(
              onPressed: () {
                controller.backButton();
              },
            ),
          ),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              ///////////////////STEP INDICATOR BAR///////////////////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: List.generate(5, (index) {
                    bool isActive = controller.currentStep == index;

                    return Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 8),
                        height: 4,
                        decoration: BoxDecoration(color: isActive ? ConstColor.primaryColor : Colors.grey.shade300, borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 6),

              ////////////////////Step Text////////////////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text("Step ${controller.currentStep + 1} of 5", style: const TextStyle(fontSize: 12, color: Colors.grey)),
              ),

              const SizedBox(height: 16),

              //////////////////All Pages////////////////
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.updateStep(index);
                  },
                  children: const [CarBasicInformation(), AddCarDetails(), AddCarPhotos(), AddCarPricing(), AddCarLocation()],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
