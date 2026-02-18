// upload_photo_verification_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/app_snack_bar/app_snack_bar.dart';
import 'package:go_connect/host_screen/cars_host_screen/Controller/cars_host_screen_controller.dart';
import 'package:go_connect/utils/log_print.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../../routes/app_routes.dart';

class UploadPhotoVerificationController extends GetxController {
  ///////////////////////ID Card////////////////////////
  Rx<File?> idFront = Rx<File?>(null);
  Rx<File?> idBack = Rx<File?>(null);

  ////////////////Driving License//////////////////////
  Rx<File?> licenseFront = Rx<File?>(null);
  Rx<File?> licenseBack = Rx<File?>(null);

  final picker = ImagePicker();

  Future<void> pickIdFront() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) idFront.value = File(picked.path);
  }

  Future<void> pickIdBack() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) idBack.value = File(picked.path);
  }

  Future<void> pickLicenseFront() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) licenseFront.value = File(picked.path);
  }

  Future<void> pickLicenseBack() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked != null) licenseBack.value = File(picked.path);
  }

  ////////////////////////BottomShit Camera + Gallery////////////////////////
  Future<void> showPickerOptions(
    VoidCallback onGallery,
    VoidCallback onCamera,
  ) async {
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
                onCamera();
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
                onGallery();
              },
            ),

            SizedBox(height: AppSize.height(value: 20)),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  submit() {
    try {
      if (idFront.value == null) {
        AppSnackBar.error("Photo Id Front part is required");
        return;
      }
      if (idBack.value == null) {
        AppSnackBar.error("Photo Id Back part is required");
        return;
      }

      if (licenseFront.value == null) {
        AppSnackBar.error("Upload Driving license Front part is required");
        return;
      }
      if (licenseBack.value == null) {
        AppSnackBar.error("Upload Driving license Back part is required");
        return;
      }
      final carsController = Get.find<CarsHostScreenController>();
      carsController.saveCarImages({
        "idFront": idFront.value,
        "idBack": idBack.value,
        "licenseFront": licenseFront.value,
        "licenseBack": licenseBack.value,
      });
      carsController.addCars.value = true;
      Get.offAllNamed(AppRoutes.hostNavBar);
    } catch (e) {
      errorLog("submit button", e);
    }
  }
}
