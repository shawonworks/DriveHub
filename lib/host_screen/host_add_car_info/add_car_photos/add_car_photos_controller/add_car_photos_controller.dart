// lib/host_screen/host_add_car_info/add_car_photos/add_car_photos_controller/add_car_photos_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_info_tab_bar/add_car_info_tab_bar_controller/add_car_info_tab_bar_controller.dart';
import 'package:go_connect/utils/log_print.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_connect/utils/app_size.dart';

class AddCarPhotosController extends GetxController {
  final ImagePicker picker = ImagePicker();
  RxList<File?> photos = List<File?>.filled(12, null).obs;

  int get uploadedCount {
    return photos.where((photo) => photo != null).length;
  }

  void nextPage() {
    try {
      Get.put(AddCarController()).nextPage();
    } catch (e) {
      errorLog("nextPage", e);
    }
  }

  void backButton() {
    try {
      Get.put(AddCarController()).backButton();
    } catch (e) {
      errorLog("nextPage", e);
    }
  }

  ///////////Bottom Sheet for Gallery + Camera///////////////
  Future<void> pickImage(int index) async {
    await Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSize.width(value: 20)), topRight: Radius.circular(AppSize.width(value: 20))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: AppSize.height(value: 12)),
              width: AppSize.width(value: 40),
              height: AppSize.height(value: 4),
              decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(AppSize.width(value: 2))),
            ),

            SizedBox(height: AppSize.height(value: 20)),
            Text(
              "Select Image Source",
              style: TextStyle(fontSize: AppSize.width(value: 18), fontWeight: FontWeight.bold),
            ),

            SizedBox(height: AppSize.height(value: 20)),
            ListTile(
              leading: Icon(Icons.camera_alt, size: AppSize.width(value: 28), color: Colors.teal),
              title: Text("Camera", style: TextStyle(fontSize: AppSize.width(value: 16))),
              onTap: () {
                Get.back();
                _pickFromSource(ImageSource.camera, index);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, size: AppSize.width(value: 28), color: Colors.teal),
              title: Text("Gallery", style: TextStyle(fontSize: AppSize.width(value: 16))),
              onTap: () {
                Get.back();
                _pickFromSource(ImageSource.gallery, index);
              },
            ),

            SizedBox(height: AppSize.height(value: 20)),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Future<void> _pickFromSource(ImageSource source, int index) async {
    final XFile? picked = await picker.pickImage(source: source, imageQuality: 85);
    if (picked != null) {
      photos[index] = File(picked.path);
      update();
    }
  }
}

// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class AddCarPhotosController extends GetxController {
//   final ImagePicker picker = ImagePicker();
//   RxList<File?> photos = List<File?>.filled(12, null).obs;
//
//   int get uploadedCount {
//     return photos.where((photo) => photo != null).length;
//   }
//
//   ///////////Image pick function///////////////
//   Future<void> pickImage(int index) async {
//     final XFile? picked = await picker.pickImage(source: ImageSource.camera);
//     if (picked != null) {
//       photos[index] = File(picked.path);
//       update();
//     }
//   }
// }
//
//
//
