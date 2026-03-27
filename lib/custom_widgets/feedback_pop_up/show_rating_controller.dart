import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  var rating = 3.0.obs;
  final feedbackController = TextEditingController();
  late String ratingToUserID;
  late String bookingID;

  void setRating(double value) {
    rating.value = value;
  }

  void cancleButton() {
    feedbackController.clear();
    rating.value = 3;
    Get.back();
  }

  @override
  void onClose() {
    feedbackController.dispose();
    super.onClose();
  }
}
