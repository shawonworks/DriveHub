import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:get/get.dart';
import 'package:go_connect/utils/app_size.dart';
import '../../../../constant/const_color.dart';
import '../../../../constant/const_icons.dart';
import '../../../../utils/gap.dart' show Gap;
import '../add_car_photos_controller/add_car_photos_controller.dart';

class AddCarPhotosViewScreen extends StatelessWidget {
  AddCarPhotosViewScreen({super.key});

  final List<String> titles = [
    ConstString.front,
    ConstString.back,
    ConstString.leftSide,
    ConstString.rightSide,
    ConstString.interiorFront,
    ConstString.interiorBack,
    ConstString.additional1,
    ConstString.additional1,
    ConstString.additional1,
    ConstString.additional1,
    ConstString.additional1,
    ConstString.additional1,
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddCarPhotosController>();

    return Padding(
      padding: EdgeInsets.all(AppSize.width(value: 16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: titles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSize.height(value: 14),
                crossAxisSpacing: AppSize.width(value: 18),
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                return _uploadBox(titles[index], index, controller);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadBox(
    String title,
    int index,
    AddCarPhotosController controller,
  ) {
    return GestureDetector(
      onTap: () => controller.pickImage(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: AppSize.width(value: 14),
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(height: 6),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.width(value: 8)),
                ),
                border: Border.all(
                  color: ConstColor.grey,
                  width: AppSize.width(value: 2),
                ),
              ),
              child: Obx(() {
                final photo = controller.photos[index];
                if (photo != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(
                      AppSize.width(value: 6),
                    ),
                    child: Image.file(
                      photo,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        ConstIcons.uploadIcon,
                        height: AppSize.height(value: 28),
                        color: ConstColor.blueGrey,
                      ),
                      SizedBox(height: AppSize.height(value: 6)),
                      Text(
                        ConstString.upload,
                        style: TextStyle(
                          color: ConstColor.blueGrey,
                          fontSize: AppSize.width(value: 12),
                        ),
                      ),
                    ],
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
