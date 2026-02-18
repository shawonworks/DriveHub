import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_connect/routes/app_routes.dart';

import '../host_booking_check_out_card.dart' show HostBookingCheckOutCard;

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: (){
             Get.toNamed(AppRoutes.bookingDetailsCheckoutPage);
          },
          child: HostBookingCheckOutCard()),
    );
  }
}
