import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ReSubmitKycController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  // Four variables for different image paths
  String? photoIdFrontPath;
  String? photoIdBackPath;
  String? drivingLicenceFrontPath;
  String? drivingLicenceBackPath;

  // API image URLs (if available from API)
  String? photoIdFrontUrl;
  String? photoIdBackUrl;
  String? drivingLicenceFrontUrl;
  String? drivingLicenceBackUrl;

  bool isSubmitting = false;

  @override
  void onInit() {
    super.onInit();
    // Initialize with API data if available
    loadExistingImages();
  }

  void loadExistingImages() {
    // This method will be called when you integrate API
    // For now, keeping it empty
    // You can set the URL values here when API is integrated
    update();
  }

  Future<void> pickPhotoIdFront() async {
    await _pickImage((path) {
      photoIdFrontPath = path;
      update();
    });
  }

  Future<void> pickPhotoIdBack() async {
    await _pickImage((path) {
      photoIdBackPath = path;
      update();
    });
  }

  Future<void> pickDrivingLicenceFront() async {
    await _pickImage((path) {
      drivingLicenceFrontPath = path;
      update();
    });
  }

  Future<void> pickDrivingLicenceBack() async {
    await _pickImage((path) {
      drivingLicenceBackPath = path;
      update();
    });
  }

  Future<void> _pickImage(Function(String?) onImagePicked) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (image != null) {
        onImagePicked(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<void> takePhotoIdFront() async {
    await _takePhoto((path) {
      photoIdFrontPath = path;
      update();
    });
  }

  Future<void> takePhotoIdBack() async {
    await _takePhoto((path) {
      photoIdBackPath = path;
      update();
    });
  }

  Future<void> takeDrivingLicenceFront() async {
    await _takePhoto((path) {
      drivingLicenceFrontPath = path;
      update();
    });
  }

  Future<void> takeDrivingLicenceBack() async {
    await _takePhoto((path) {
      drivingLicenceBackPath = path;
      update();
    });
  }

  Future<void> _takePhoto(Function(String?) onImageTaken) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (image != null) {
        onImageTaken(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to take photo: $e');
    }
  }

  void showImageSourceOptions(String imageType) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Image Source',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                Get.back();
                _handleImageSelection(imageType, true);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                Get.back();
                _handleImageSelection(imageType, false);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleImageSelection(String imageType, bool fromCamera) {
    switch (imageType) {
      case 'photoIdFront':
        fromCamera ? takePhotoIdFront() : pickPhotoIdFront();
        break;
      case 'photoIdBack':
        fromCamera ? takePhotoIdBack() : pickPhotoIdBack();
        break;
      case 'drivingLicenceFront':
        fromCamera ? takeDrivingLicenceFront() : pickDrivingLicenceFront();
        break;
      case 'drivingLicenceBack':
        fromCamera ? takeDrivingLicenceBack() : pickDrivingLicenceBack();
        break;
    }
  }

  bool get hasPhotoIdFront => photoIdFrontPath != null || photoIdFrontUrl != null;
  bool get hasPhotoIdBack => photoIdBackPath != null || photoIdBackUrl != null;
  bool get hasDrivingLicenceFront =>
      drivingLicenceFrontPath != null || drivingLicenceFrontUrl != null;
  bool get hasDrivingLicenceBack =>
      drivingLicenceBackPath != null || drivingLicenceBackUrl != null;

  bool get canSubmit => hasPhotoIdFront && hasPhotoIdBack;

  Future<void> submitKyc() async {
    if (!canSubmit) {
      Get.snackbar('Error', 'Please upload required documents');
      return;
    }

    isSubmitting = true;
    update();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Here you can integrate your API call
      // Use the four path variables for API integration:
      // - photoIdFrontPath
      // - photoIdBackPath
      // - drivingLicenceFrontPath
      // - drivingLicenceBackPath

      Get.snackbar('Success', 'KYC documents submitted successfully');
      Get.back(); // Navigate back after successful submission
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit KYC: $e');
    } finally {
      isSubmitting = false;
      update();
    }
  }
}
