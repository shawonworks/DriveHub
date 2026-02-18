import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_photos/add_car_photos_controller/add_car_photos_controller.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../../constant/const_color.dart';
import '../../../constant/const_string.dart';
import '../../../custom_widgets/custom_elevated_button.dart';
import '../../../utils/gap.dart';
import 'Widget/add_car_photos_screen.dart';

class AddCarPhotos extends StatelessWidget {
  const AddCarPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarPhotosController>(
      init: AddCarPhotosController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(AppSize.width(value: 15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ConstString.photos,
                  style: TextStyle(fontSize: AppSize.width(value: 20), fontWeight: FontWeight.bold),
                ),
                Text(
                  ConstString.uploadMinimum12PhotosOfYourCar,
                  style: TextStyle(fontSize: AppSize.width(value: 14), color: ConstColor.grey),
                ),
                Gap(height: 10),

                Row(
                  children: [
                    Container(
                      width: AppSize.width(value: 10),
                      height: AppSize.height(value: 6),
                      decoration: BoxDecoration(color: ConstColor.primaryColor, shape: BoxShape.circle),
                    ),
                    Gap(height: 10),
                    Obx(
                      () => Text(
                        "${controller.uploadedCount} of 12 Minimum Photos Uploaded",
                        style: TextStyle(fontSize: AppSize.width(value: 12), color: ConstColor.primaryColor),
                      ),
                    ),
                  ],
                ),

                Flexible(child: AddCarPhotosViewScreen()),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      onPressed: () {
                        controller.backButton();
                      },
                      width: AppSize.width(value: 160),
                      height: AppSize.height(value: 56),
                      color: ConstColor.white,
                      child: Text(
                        ConstString.previous,
                        style: TextStyle(fontSize: AppSize.width(value: 20), color: ConstColor.grey),
                      ),
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        controller.nextPage();
                      },
                      width: AppSize.width(value: 160),
                      height: AppSize.height(value: 56),
                      child: Text(
                        ConstString.next,
                        style: TextStyle(fontSize: AppSize.width(value: 20), color: ConstColor.white),
                      ),
                    ),
                  ],
                ),

                Gap(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
