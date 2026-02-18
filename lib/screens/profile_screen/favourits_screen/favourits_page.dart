import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/car_card.dart';

class FavouritsPage extends StatelessWidget {
  const FavouritsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.savedPost),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: 6,
        itemBuilder: (context, index) => Padding(padding: const EdgeInsets.symmetric(vertical: 8.0), child: CarCard()),
      ),
    );
  }
}
