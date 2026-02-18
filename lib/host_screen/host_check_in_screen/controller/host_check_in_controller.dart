import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HostCheckInController extends GetxController {
  TextEditingController textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  Future<void> pickPhotoFromGallery() async {
    await _pickImage((path) {
      var inboxImagePath = path;
      print('$inboxImagePath');
    });
    update();
  }

  Future<void> _pickImage(Function(String?) onImagePicked) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery,maxWidth: 1800, maxHeight:  1800, imageQuality:  85);

      if (image != null) {
        onImagePicked(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

}