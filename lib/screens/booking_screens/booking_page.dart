import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/booking_screens/booking_card.dart';
import 'package:go_connect/screens/booking_screens/controller/booking_controller.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/routes/app_routes.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: GetBuilder<BookingController>(
                init: BookingController(),
                builder: (controller) {
                  return Row(
                    children: List.generate(controller.filterList.length, (index) {
                      var data = controller.filterList[index];
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
                              border: Border.all(color: isSelected ? ConstColor.textColor : ConstColor.silverGray20, width: 1.5),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                data,
                                style: TextStyle(color: isSelected ? Colors.white : ConstColor.textColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(onTap: () => Get.toNamed(AppRoutes.bookingDetailsPage), child: BookingCard());
              },
            ),
          ],
        ),
      ),
    );
  }
}
