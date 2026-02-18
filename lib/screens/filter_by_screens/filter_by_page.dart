import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/screens/filter_by_screens/controller/filter_by_controller.dart';
import 'package:go_connect/utils/app_size.dart';

class FilterByPage extends StatelessWidget {
  const FilterByPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FilterByController(),
      builder: (controller) {
        return Scaffold(
          appBar: appBarBlankWithBackButton(ConstString.filterBy),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PriceSlider(controller: controller),
                SizedBox(height: AppSize.width(value: 5)),
                VehicleType(controller: controller),
                SizedBox(height: AppSize.width(value: 10)),
                Seats(controller: controller),
                SizedBox(height: AppSize.width(value: 5)),
                DistanceSlider(controller: controller),
                Rating(controller: controller),
                SizedBox(height: AppSize.width(value: 10)),
                FuelType(controller: controller),
                Transmission(controller: controller),
                CarType(controller: controller),
                ResetApplyButton(controller: controller),
                SizedBox(height: AppSize.width(value: 120)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ResetApplyButton extends StatelessWidget {
  final FilterByController controller;

  const ResetApplyButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            elevation: 0,
            right: AppSize.width(value: 9),
            height: 48,
            isoutLined: true,
            outLineColour: ConstColor.cardBorderColour,
            child: CustomText(
              title: ConstString.reset,
              textSize: AppSize.width(value: 18),
              textColor: ConstColor.textColor,
            ),
            onPressed: () => controller.resetFilter(),
          ),
        ),

        Expanded(
          child: CustomElevatedButton(
            elevation: 0,
            left: AppSize.width(value: 9),
            height: 48,

            child: CustomText(
              title: ConstString.apply,
              textSize: AppSize.width(value: 18),
              textColor: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class CarType extends StatelessWidget {
  final FilterByController controller;

  const CarType({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: ConstString.carType,
          textSize: AppSize.width(value: 16),
        ),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.carTypeOtions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 20),
                label: Text(option),
                selected: controller.selectedCarType == index,
                selectedColor: ConstColor.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedCarType == index
                      ? Colors.white
                      : ConstColor.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColor.cardBorderColour),
                ),
                onSelected: (_) => controller.setCarType(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Transmission extends StatelessWidget {
  final FilterByController controller;

  const Transmission({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: ConstString.transmission,
            textSize: AppSize.width(value: 16),
          ),

          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  elevation: 0,
                  right: AppSize.width(value: 9),
                  height: 48,
                  isoutLined: !controller.manual,
                  outLineColour: ConstColor.textColor,
                  color: controller.manual
                      ? ConstColor.textColor
                      : Colors.white,
                  child: CustomText(
                    title: ConstString.manual,
                    textSize: AppSize.width(value: 18),
                    textColor: controller.manual
                        ? Colors.white
                        : ConstColor.textColor,
                  ),
                  onPressed: () => controller.setTransmissionMode(true),
                ),
              ),

              Expanded(
                child: CustomElevatedButton(
                  elevation: 0,
                  isoutLined: controller.manual,
                  outLineColour: ConstColor.textColor,
                  left: AppSize.width(value: 9),
                  height: 48,
                  color: controller.manual == false
                      ? ConstColor.textColor
                      : Colors.white,
                  child: CustomText(
                    title: ConstString.automatic,
                    textSize: AppSize.width(value: 18),
                    textColor: controller.manual == false
                        ? Colors.white
                        : ConstColor.textColor,
                  ),
                  onPressed: () => controller.setTransmissionMode(false),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FuelType extends StatelessWidget {
  final FilterByController controller;

  const FuelType({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: ConstString.fuelType,
          textSize: AppSize.width(value: 16),
        ),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.fuelTypeOtions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.symmetric(horizontal: 20),
                label: Text(option),
                selected: controller.selectedFuelType == index,
                selectedColor: ConstColor.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedFuelType == index
                      ? Colors.white
                      : ConstColor.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColor.cardBorderColour),
                ),
                onSelected: (_) => controller.setFuelType(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class Rating extends StatelessWidget {
  final FilterByController controller;

  const Rating({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: ConstString.rating,
          textSize: AppSize.width(value: 16),
        ),
        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.ratingOptions.asMap().entries.map((entry) {
            final index = entry.key;
            // final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ConstIcons.starIcon,
                      colorFilter: ColorFilter.mode(
                        controller.selectedRating == index
                            ? Colors.white
                            : ConstColor.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text("${index + 1}"),
                  ],
                ),
                selected: controller.selectedRating == index,
                selectedColor: ConstColor.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedRating == index
                      ? Colors.white
                      : ConstColor.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColor.cardBorderColour),
                ),
                onSelected: (_) => controller.setRating(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class DistanceSlider extends StatelessWidget {
  final FilterByController controller;

  const DistanceSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: ConstString.priceTarget,
          textSize: AppSize.width(value: 16),
        ),
        Slider(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
          activeColor: ConstColor.textColor,
          inactiveColor: ConstColor.cardBorderColour,
          min: 0.0,
          max: 10.0,
          onChanged: (value) => controller.setDistanceRange(value),
          divisions: 10,
          value: controller.selectedDistanceRange,
          label: '${controller.selectedDistanceRange.round()} km',
        ),
      ],
    );
  }
}

class Seats extends StatelessWidget {
  final FilterByController controller;

  const Seats({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: ConstString.seat, textSize: AppSize.width(value: 16)),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.seatOptions.asMap().entries.map((entry) {
            final index = entry.key;
            // final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ConstIcons.vehicleTypeIcon,
                      colorFilter: ColorFilter.mode(
                        controller.selectedseatNumber == index
                            ? Colors.white
                            : ConstColor.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text("${index + 1}"),
                  ],
                ),
                selected: controller.selectedseatNumber == index,
                selectedColor: ConstColor.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedseatNumber == index
                      ? Colors.white
                      : ConstColor.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColor.cardBorderColour),
                ),
                onSelected: (_) => controller.setseatNumber(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class VehicleType extends StatelessWidget {
  final FilterByController controller;

  const VehicleType({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: ConstString.vehicleType,
          textSize: AppSize.width(value: 16),
        ),

        Wrap(
          runSpacing: -5,
          spacing: 12,
          children: controller.vehicleTypeOtions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Theme(
              data: Theme.of(context).copyWith(
                chipTheme: ChipTheme.of(context).copyWith(
                  showCheckmark: false, // <-- hides the checkmark
                ),
              ),
              child: ChoiceChip(
                padding: EdgeInsets.all(0),
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ConstIcons.vehicleTypeIcon,
                      colorFilter: ColorFilter.mode(
                        controller.selectedVehicleType == index
                            ? Colors.white
                            : ConstColor.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(option),
                  ],
                ),
                selected: controller.selectedVehicleType == index,
                selectedColor: ConstColor.textColor,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: controller.selectedVehicleType == index
                      ? Colors.white
                      : ConstColor.textColor,
                ),
                shape: StadiumBorder(
                  side: BorderSide(color: ConstColor.cardBorderColour),
                ),
                onSelected: (_) => controller.setVehicleType(index),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class PriceSlider extends StatelessWidget {
  final FilterByController controller;

  const PriceSlider({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: ConstString.priceTarget,
          textSize: AppSize.width(value: 16),
        ),
        RangeSlider(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
          activeColor: ConstColor.textColor,
          inactiveColor: ConstColor.cardBorderColour,
          min: 0.0,
          max: 25000.0,
          values: controller.selectedPriceRange,
          onChanged: (value) => controller.setPriceRange(value),
          divisions: (25000.0 / 500).round(),
          labels: RangeLabels(
            '${controller.selectedPriceRange.start.round()} CFA',
            '${controller.selectedPriceRange.end.round()} CFA',
          ),
        ),
      ],
    );
  }
}
