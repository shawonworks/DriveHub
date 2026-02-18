import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class CheckInController extends GetxController {
  late MultiImagePickerController controller;

  @override
  void onInit() {
    super.onInit();
    controller = MultiImagePickerController(
      maxImages: 8,
      picker: (int pickCount, Object? params) async {
        final picker = ImagePicker();
        final List<ImageFile> pickedImages = [];

        // Show source selection dialog
        final ImageSource? source = await Get.dialog<ImageSource>(
          AlertDialog(
            title: const Text('Select Image Source'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () => Get.back(result: ImageSource.camera),
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () => Get.back(result: ImageSource.gallery),
                ),
              ],
            ),
          ),
        );

        if (source == null) return pickedImages;

        if (source == ImageSource.camera) {
          // Camera - take multiple photos
          for (int i = 0; i < pickCount; i++) {
            try {
              final XFile? photo = await picker.pickImage(source: ImageSource.camera);
              if (photo == null) break;

              // Verify file exists before adding
              final file = File(photo.path);
              if (await file.exists()) {
                pickedImages.add(
                  ImageFile(
                    photo.path,
                    name: photo.path.split('/').last,
                    extension: photo.path.split('.').last,
                    path: photo.path,
                    bytes: null,
                  ),
                );
              }
            } catch (e) {
              print('Camera error: $e');
              break;
            }
          }
        } else {
          // Gallery - pick single image at a time
          for (int i = 0; i < pickCount; i++) {
            try {
              final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
              if (photo == null) break;

              // Verify file exists before adding
              final file = File(photo.path);
              if (await file.exists()) {
                pickedImages.add(
                  ImageFile(
                    photo.path,
                    name: photo.path.split('/').last,
                    extension: photo.path.split('.').last,
                    path: photo.path,
                    bytes: null,
                  ),
                );
              }
            } catch (e) {
              print('Gallery error: $e');
              break;
            }
          }
        }

        return pickedImages;
      },
    );
  }

  Iterable<ImageFile> get selectedImages => controller.images;

  void clearImages() {
    controller.clearImages();
    update();
  }
}

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_image_picker_view/multi_image_picker_view.dart';

// class CheckInController extends GetxController {
//   late MultiImagePickerController controller;

//   @override
//   void onInit() {
//     super.onInit();
//     controller = MultiImagePickerController(
//       maxImages: 8, // how many max camera shots user can take
//       picker: (int pickCount, Object? params) async {
//         final picker = ImagePicker();
//         final List<ImageFile> pickedImages = [];

//         // Allow multiple shots until user reaches pickCount
//         for (int i = 0; i < pickCount; i++) {
//           final XFile? photo = await picker.pickImage(source: ImageSource.camera);

//           if (photo == null) break; // user canceled

//           pickedImages.add(
//             ImageFile(
//               photo.path, // <- unique key (can be uuid, or just photo.path)
//               name: photo.path.split('/').last, // file name
//               extension: photo.path.split('.').last, // file extension
//               path: photo.path, // file path
//               bytes: null, // you can keep null if you don’t need bytes immediately
//             ),
//           );
//         }

//         return pickedImages;
//       },
//     );
//   }

//   Iterable<ImageFile> get selectedImages => controller.images;

//   void clearImages() {
//     controller.clearImages();
//     update();
//   }
// }
