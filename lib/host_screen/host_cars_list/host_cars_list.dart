import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/const_color.dart';
import '../../constant/const_icons.dart';
import '../../constant/const_string.dart';
import '../../custom_tab_bar/custom_tab_bar.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/text/custom_text.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_size.dart';
import '../../utils/gap.dart';
import '../host_car_card/host_car_card.dart';
import 'controller/host_cars_list_controller.dart';

class HostCarsList extends StatelessWidget {
  const HostCarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HostCarsListController>(
      init: HostCarsListController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        width: AppSize.size.width * 0.15,
                        height: AppSize.size.height * 0.11,
                        decoration: BoxDecoration(
                          color: ConstColor.teal,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(ConstIcons.runCarIcon),
                        ),
                      ),
                    ),
                  ),
                  ////////add car button
                  CustomElevatedButton(
                    onPressed: () => Get.toNamed(AppRoutes.addCarPage),
                    left: AppSize.width(value:70),
                    right: AppSize.width(value:70),
                    height: 48 ,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Colors.white, fontWeight: FontWeight.bold),
                        Gap(width: 8,),
                        Text(ConstString.addaCar, style: TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ),

                  Gap(height: 15,),
                  CustomText(title: ConstString.carList, textSize: AppSize.width(value: 20), fontWeight: FontWeight.w700),
                  Gap(height: 8,),

                  Expanded(
                    child: CustomTabBar(
                      pages: [
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: List.generate(5, (i) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: HostCarCard(status: "Requested",onTap: (){
                                Get.toNamed(AppRoutes.hostCarDetailsPage);
                              },),
                            )),
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: List.generate(5, (i) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: HostCarCard(status: "Active",onTap: (){
                                Get.toNamed(AppRoutes.hostCarDetailsPage);
                              },),
                            )),
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: List.generate(5, (i) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: HostCarCard(status: "Cancelled",onTap: (){
                                Get.toNamed(AppRoutes.hostCarDetailsPage);
                              },),
                            )),
                          ),
                        ),
                      ],
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
