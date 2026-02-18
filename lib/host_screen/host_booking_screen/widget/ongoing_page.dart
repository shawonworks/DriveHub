import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:go_connect/host_screen/host_booking_screen/host_booking_card.dart';

import '../../../routes/app_routes.dart';

class OngoingPage extends StatelessWidget {
  const OngoingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.hostBookingDetailsPage),
        child: HostBookingCard());
  }
}