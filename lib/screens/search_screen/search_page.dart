import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/custom_widgets/buttons/custom_check_box_button.dart';
import 'package:go_connect/custom_widgets/car_card.dart';
import 'package:go_connect/custom_widgets/custom_form_field.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/screens/search_screen/controller/search_page_controller.dart';
import 'package:go_connect/screens/search_screen/widgets/search_screen_pick_up_date_build_widget.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchPageController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(onTap: () => Get.toNamed(AppRoutes.shortByPage), child: SvgPicture.asset(ConstIcons.filterIcon)),
                          SizedBox(width: 10),
                          GestureDetector(onTap: () => Get.toNamed(AppRoutes.filterByPage), child: SvgPicture.asset(ConstIcons.sortIcon)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppSize.width(value: 10)),
                        child: CustomTextFormField(
                          prefixIcon: Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: AppSize.width(value: 10)),
                              child: Icon(Icons.search),
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(maxWidth: AppSize.width(value: 30)),
                          textController: controller.destinationTextEditingController,
                          focusNode: controller.focusNode,
                          // fromTitle: "Destination",
                          fromTitle: "Location",
                          borderRadius: AppSize.width(value: 100),
                          hintText: CustomText(title: "Search Location"),
                        ),
                      ),
                    ],
                  ),
                  Gap(height: 5),
                  Obx(
                    () => SearchScreenPickUpDateBuildWidget(
                      date: controller.pickUpDate.value,
                      time: controller.pickUpTime.value,
                      onDateSelected: controller.formatePickUpData,
                      onTimeSelected: controller.formatePickUpTime,
                    ),
                  ),
                  // Gap(height: 8),
                  // Obx(
                  //   () => SearchScreenDropOffDateBuildWidget(
                  //     date: controller.dropOffDate.value,
                  //     time: controller.dropOfTime.value,
                  //     onDateSelected: controller.formateDropDate,
                  //     onTimeSelected: controller.formateDropTime,
                  //   ),
                  // ),
                  Gap(height: 10),
                  Row(
                    children: [
                      CustomCheckBoxButton(onChange: (value) {}),
                      Gap(width: 5),
                      CustomText(title: "Rent this car with a driver"),
                    ],
                  ),
                  // Gap(height: 10),
                  Align(
                    // child: CustomElevatedButton(
                    //   onPressed: () {},
                    //   height: AppSize.width(value: 50),

                    //   child: CustomText(
                    //     title: "Search Car",
                    //     fontWeight: FontWeight.w500,
                    //     textSize: AppSize.width(value: 15),
                    //     textColor: Colors.white,
                    //   ),
                    // ),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.carsPage);
                      },
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 35), vertical: AppSize.width(value: 8)),
                        decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(AppSize.width(value: 50))),
                        child: CustomText(title: "Search", fontWeight: FontWeight.w500, textSize: AppSize.width(value: 15), textColor: Colors.white),
                      ),
                    ),
                  ),
                  Gap(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.carDetailsPage);
                      },
                      child: Padding(padding: const EdgeInsets.symmetric(vertical: 12.0), child: CarCard()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
