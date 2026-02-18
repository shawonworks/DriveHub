import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';

import 'package:go_connect/custom_widgets/car_card.dart';
import 'package:go_connect/screens/cars_screens/controller/car_screen_controller.dart';
import 'package:go_connect/screens/cars_screens/widgets/car_header_widget.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CarScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: carHeaderWidget(title: ConstString.cars, controller: controller),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Padding(padding: const EdgeInsets.symmetric(vertical: 12.0), child: CarCard()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
