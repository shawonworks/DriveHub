import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';

class FilterByController extends GetxController {
  RangeValues selectedPriceRange = RangeValues(5000, 15000);
  double selectedDistanceRange = 5.0;
  bool withDriver = true;
  bool manual = false;
  int selectedVehicleType = 0;
  int selectedseatNumber = 3;
  int selectedRating = 2;
  int selectedFuelType = 1;
  int selectedCarType = 1;
  List<String> vehicleTypeOtions = [
    ConstString.car,
    ConstString.trucks,
    ConstString.minivas,
    ConstString.van,
    ConstString.suv,
    ConstString.cargo,
  ];

  List<String> fuelTypeOtions = [
    ConstString.petrol,
    ConstString.gasoline,
    ConstString.electric,
    ConstString.diesel,
    ConstString.hybrid,
  ];

  List<String> carTypeOtions = [
    ConstString.premium,
    ConstString.standard,
    ConstString.economic,
    ConstString.special,
  ];

  List<String> seatOptions = ['1', '2', '3', '4', '5'];
  List<String> ratingOptions = ['1', '2', '3', '4', '5'];

  void setPriceRange(RangeValues newPriceRange) {
    selectedPriceRange = newPriceRange;
    update();
  }

  void setDistanceRange(double newDistanceRange) {
    selectedDistanceRange = newDistanceRange;
    update();
  }

  void setDrivingMode(bool newDrivingMode) {
    withDriver = newDrivingMode;
    update();
  }

  void setTransmissionMode(bool newTransmissionMode) {
    manual = newTransmissionMode;
    update();
  }

  void setVehicleType(int newVehicleType) {
    selectedVehicleType = newVehicleType;
    update();
  }

  void setseatNumber(int newSeatNumber) {
    selectedseatNumber = newSeatNumber;
    update();
  }

  void setRating(int newRating) {
    selectedRating = newRating;
    update();
  }

  void setFuelType(int newFuelType) {
    selectedFuelType = newFuelType;
    update();
  }

  void setCarType(int newCarType) {
    selectedCarType = newCarType;
    update();
  }

  void resetFilter() {
    selectedPriceRange = RangeValues(5000, 15000);
    selectedDistanceRange = 5.0;
    withDriver = true;
    manual = false;
    selectedVehicleType = 0;
    selectedseatNumber = 3;
    selectedRating = 2;
    selectedFuelType = 1;
    selectedCarType = 1;
    update();
  }

  @override
  void dispose() {
    selectedPriceRange = RangeValues(5000, 15000);
    selectedDistanceRange = 5.0;
    withDriver = true;
    manual = false;
    selectedVehicleType = 0;
    selectedseatNumber = 3;
    selectedRating = 2;
    selectedFuelType = 1;
    selectedCarType = 1;
    super.dispose();
  }
}
