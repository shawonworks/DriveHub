// lib/host_screen/cars_host_screen/cars_host_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../constant/const_color.dart';
import '../../constant/const_icons.dart';
import '../../constant/const_string.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/text/custom_text.dart';
import '../../utils/app_size.dart';
import '../../utils/gap.dart';
import '../host_cars_list/host_cars_list.dart';
import 'Controller/cars_host_screen_controller.dart';
import 'Widget/show_custom_success_dialog.dart';

class CarsHostScreen extends StatelessWidget {
  const CarsHostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarsHostScreenController>(
      init: CarsHostScreenController(),
      builder: (controller) {
        return Scaffold(
          body: controller.addCars.value == true
              ? HostCarsList()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: AppSize.height(value: 100)),
                          child: Container(
                            alignment: Alignment.center,
                            width: AppSize.size.width * 0.5,
                            height: AppSize.size.width * 0.5,
                            decoration: BoxDecoration(color: ConstColor.teal, shape: BoxShape.circle),
                            child: Padding(
                              padding: EdgeInsets.all(AppSize.width(value: 40)),
                              child: SvgPicture.asset(ConstIcons.runCarIcon, width: AppSize.size.width * 0.2, height: AppSize.size.width * 0.2),
                            ),
                          ),
                        ),
                      ),

                      Gap(height: 10),

                      CustomText(title: ConstString.welcomePartner, textSize: AppSize.width(value: 24), fontWeight: FontWeight.bold),

                      SizedBox(height: AppSize.height(value: 20)),

                      CustomText(title: ConstString.addYourFirstCarToStartEarning, textSize: AppSize.width(value: 16), textColor: ConstColor.blueGrey),

                      Gap(height: 20),

                      CustomElevatedButton(
                        onPressed: () {
                          showCustomSuccessDialog(title: ConstString.tomoveforwardpleaseuploadaphotoof);
                        },
                        left: AppSize.width(value: 110),
                        right: AppSize.width(value: 110),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white, fontWeight: FontWeight.bold),
                            SizedBox(width: AppSize.width(value: 8)),
                            Text(
                              ConstString.addaCar,
                              style: TextStyle(color: Colors.white, fontSize: AppSize.width(value: 16)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
