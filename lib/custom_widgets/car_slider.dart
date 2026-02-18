import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/home_screen/controller/home_page_controller.dart';
import 'package:go_connect/routes/app_routes.dart';

class CarSlider extends StatelessWidget {
  const CarSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (controller) {
        return CarouselSlider(
          items: controller.sliderImageList.map((imgPath) {
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.carDetailsPage),
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
                ),
              ),
            );
          }).toList(),
          carouselController: controller.carouselController,
          options: CarouselOptions(
            height: 190,
            autoPlay: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              controller.updateSliderIndex(index);
            },
          ),
        );
      },
    );
  }
}
