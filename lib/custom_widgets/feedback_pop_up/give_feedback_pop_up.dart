import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/custom_widgets/feedback_pop_up/show_rating_controller.dart';
import 'package:go_connect/utils/app_size.dart';

Future<void> giveFeedbackPopUp({required BuildContext context}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: FeedbackPopup());
    },
  );
}

class FeedbackPopup extends StatelessWidget {
  const FeedbackPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedbackController controller = Get.put(FeedbackController());

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentGeometry.topRight,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.cancel_outlined, color: Colors.grey),
              ),
            ),
            Image.asset(ConstIcons.rateAppExperienceIcon),
            const SizedBox(height: 17),
            const CustomText(title: ConstString.rateYourRideExperiences, textSize: 22, fontWeight: FontWeight.w700),
            const SizedBox(height: 12),

            // ⭐ Rating Bar
            Obx(
              () => RatingBar.builder(
                initialRating: controller.rating.value,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  controller.setRating(rating);
                },
              ),
            ),
            // const SizedBox(height: 15),

            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: const CustomText(
            //     title: "Write Your feedback",
            //     textSize: 16,
            //     fontWeight: FontWeight.w700,
            //   ),
            // ),
            const SizedBox(height: 12),
            CustomTextFormField(
              textController: controller.feedbackController,
              maxLine: 3,
              hintText: Text(ConstString.giveYourFeedbackHere),
              fromTitle: '',
              borderRadius: 8,
              validator: (String? p1) {
                return null;
              },
            ),

            const SizedBox(height: 12),

            Align(
              alignment: AlignmentGeometry.centerRight,
              child: CustomElevatedButton(
                height: 40,
                width: 134,
                buttonBorderRadius: 100,
                child: CustomText(
                  title: ConstString.submitButton,
                  fontWeight: FontWeight.w400,
                  textSize: AppSize.width(value: 14),
                  textColor: Colors.white,
                ),

                // Text("Submit"),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
