import 'package:flutter/material.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class RequestBookingDetailsCard extends StatelessWidget {
  const RequestBookingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(height: 10),
        CustomText(title: "Details", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 20)),
        Gap(height: 10),
        _BuildRow(title: "Duration:", body: "3 Days 10 hours"),
        _BuildRow(title: "Day Rate:", body: "125.00"),
        _BuildRow(title: "Total Cost:", body: "₣ 460.00"),
      ],
    );
  }
}

class _BuildRow extends StatelessWidget {
  const _BuildRow({required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomText(title: title, textHeight: 1.5, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: CustomText(title: body, textHeight: 1.5, fontWeight: FontWeight.w500, textAlign: TextAlign.end),
        ),
      ],
    );
  }
}
