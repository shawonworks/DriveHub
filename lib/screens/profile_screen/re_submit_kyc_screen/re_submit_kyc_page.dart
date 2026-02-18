import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'dart:io';
import 'package:go_connect/screens/profile_screen/re_submit_kyc_screen/controller/re_submit_kyc_controller.dart';
// Import your controller file here
// import 'resubmit_kyc_controller.dart';

class ReSubmitKycPage extends StatelessWidget {
  const ReSubmitKycPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: appBarBlankWithBackButton(ConstString.verification),
      body: GetBuilder<ReSubmitKycController>(
        init: ReSubmitKycController(),
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Photo ID Card Section
              const Text(
                'Upload Photo ID card',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              // Front Side
              const Text(
                'Front Side',
                style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildImageUploadContainer(
                hasImage: controller.hasPhotoIdFront,
                imagePath: controller.photoIdFrontPath,
                imageUrl: controller.photoIdFrontUrl,
                onTap: () => controller.showImageSourceOptions('photoIdFront'),
              ),

              const SizedBox(height: 16),

              // Back Side
              const Text(
                'Back Side',
                style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildImageUploadContainer(
                hasImage: controller.hasPhotoIdBack,
                imagePath: controller.photoIdBackPath,
                imageUrl: controller.photoIdBackUrl,
                onTap: () => controller.showImageSourceOptions('photoIdBack'),
              ),

              const SizedBox(height: 32),

              // Driving License Section
              const Text(
                'Upload driving licence(If Any)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              const SizedBox(height: 16),

              // Front Side
              const Text(
                'Front Side',
                style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildImageUploadContainer(
                hasImage: controller.hasDrivingLicenceFront,
                imagePath: controller.drivingLicenceFrontPath,
                imageUrl: controller.drivingLicenceFrontUrl,
                onTap: () => controller.showImageSourceOptions('drivingLicenceFront'),
              ),

              const SizedBox(height: 16),

              // Back Side
              const Text(
                'Back Side',
                style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              _buildImageUploadContainer(
                hasImage: controller.hasDrivingLicenceBack,
                imagePath: controller.drivingLicenceBackPath,
                imageUrl: controller.drivingLicenceBackUrl,
                onTap: () => controller.showImageSourceOptions('drivingLicenceBack'),
              ),

              const SizedBox(height: 40),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.isSubmitting ? null : controller.submitKyc,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BFA5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                  ),
                  child: controller.isSubmitting
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Text(
                          'Submit',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploadContainer({required bool hasImage, required String? imagePath, required String? imageUrl, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: hasImage ? _buildImagePreview(imagePath, imageUrl, onTap) : _buildUploadPlaceholder(),
      ),
    );
  }

  Widget _buildImagePreview(String? imagePath, String? imageUrl, VoidCallback onRetake) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: imagePath != null
                ? Image.file(File(imagePath), fit: BoxFit.cover)
                : imageUrl != null
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return _buildUploadPlaceholder();
                    },
                  )
                : _buildUploadPlaceholder(),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onRetake,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(4)),
              child: const Icon(Icons.edit, color: Colors.white, size: 16),
            ),
          ),
        ),
        if (imageUrl != null && imagePath == null)
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(4)),
              child: const Text(
                'Upload document again?',
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildUploadPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
          child: Icon(Icons.cloud_upload_outlined, size: 24, color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        Text(
          'Upload Image',
          style: TextStyle(fontSize: 14, color: Colors.blue[600], fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
