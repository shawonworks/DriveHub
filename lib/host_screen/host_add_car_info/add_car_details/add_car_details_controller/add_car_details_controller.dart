// lib/host_screen/host_add_car_info/add_car_details/add_car_details_controller/add_car_details_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/app_snack_bar/app_snack_bar.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_info_tab_bar/add_car_info_tab_bar_controller/add_car_info_tab_bar_controller.dart';
import 'package:go_connect/utils/log_print.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_connect/utils/app_size.dart';

class AddCarDetailsController extends GetxController {
  final picker = ImagePicker();

  Rx<File?> idFront = Rx<File?>(null);
  Rx<File?> idBack = Rx<File?>(null);

  var carColor = ''.obs;
  var shortDescription = ''.obs;
  var licensePlate = ''.obs;

  Future<void> _showImagePicker(bool isFront) async {
    await Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.width(value: 20)),
            topRight: Radius.circular(AppSize.width(value: 20)),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: AppSize.height(value: 12)),
              width: AppSize.width(value: 40),
              height: AppSize.height(value: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(AppSize.width(value: 2)),
              ),
            ),
            SizedBox(height: AppSize.height(value: 20)),
            Text(
              "Select Image Source",
              style: TextStyle(
                fontSize: AppSize.width(value: 18),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.height(value: 20)),
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                size: AppSize.width(value: 28),
                color: Colors.teal,
              ),
              title: Text(
                "Camera",
                style: TextStyle(fontSize: AppSize.width(value: 16)),
              ),
              onTap: () {
                Get.back();
                _pickImage(ImageSource.camera, isFront);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.photo_library,
                size: AppSize.width(value: 28),
                color: Colors.teal,
              ),
              title: Text(
                "Gallery",
                style: TextStyle(fontSize: AppSize.width(value: 16)),
              ),
              onTap: () {
                Get.back();
                _pickImage(ImageSource.gallery, isFront);
              },
            ),
            SizedBox(height: AppSize.height(value: 20)),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Future<void> pickIdFront() async {
    await _showImagePicker(true);
  }

  Future<void> pickIdBack() async {
    await _showImagePicker(false);
  }

  Future<void> _pickImage(ImageSource source, bool isFront) async {
    try {
      final picked = await picker.pickImage(source: source, imageQuality: 80);
      if (picked != null) {
        if (isFront) {
          idFront.value = File(picked.path);
        } else {
          idBack.value = File(picked.path);
        }
        update();
      }
    } catch (e) {
      errorLog(isFront ? "pickIdFront" : "pickIdBack", e);
    }
  }

  bool get isValid =>
      carColor.value.isNotEmpty &&
      shortDescription.value.isNotEmpty &&
      licensePlate.value.isNotEmpty &&
      idFront.value != null &&
      idBack.value != null;

  void printAllData() {
    print("Car Color: ${carColor.value}");
    print("Description: ${shortDescription.value}");
    print("License Plate: ${licensePlate.value}");
    print("Front Image: ${idFront.value?.path}");
    print("Back Image: ${idBack.value?.path}");
  }

  void previousPage() {
    try {
      Get.put(AddCarController()).backButton();
    } catch (e) {
      errorLog("previousPage", e);
    }
  }

  void nextPage(GlobalKey<FormState> formKey) {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      if (idFront.value == null) {
        AppSnackBar.error("Car Registration paper front side is required");
        return;
      }

      if (idBack.value == null) {
        AppSnackBar.error("Car Registration paper back side is required");
        return;
      }

      Get.put(AddCarController()).nextPage();
    } catch (e) {
      errorLog("message", e);
    }
  }
}
