import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/dev_image_string.dart';
import 'package:go_connect/screens/car_details_screen/controller/car_details_controller.dart';
import 'package:go_connect/screens/car_review_screen/review_screen.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/screens/date_screen.dart/date_pick.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';

class HostCarDetailsPage extends StatelessWidget {
  const HostCarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.carsDetails),
      body: SingleChildScrollView(
        child: GetBuilder(
          init: CarDetailsController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarImage(),
                  CarLocationAndName(),
                  CheckAvaiablity(controller: controller),

                  controller.showCalander
                      ? DatePick(
                    onSelectionChanged: (value) {
                      print("object");
                      controller.setCalanderVisibility();
                    },
                  )
                      : SizedBox.shrink(),

                  Buttons(controller: controller),
                  switch (controller.currentIndex) {
                    0 => About(controller: controller),
                    1 => _imageGrid(),
                    2 => ReviewScreen(),
                    3 => Map(controller: controller),
                    _ => const Text("Default widget"),
                  },
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CheckAvaiablity extends StatelessWidget {
  final CarDetailsController controller;
  const CheckAvaiablity({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.setCalanderVisibility();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(right: 5, title: ConstString.availableForBooking, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w700,textColor: Color(0xff00AEA8),),

            controller.showCalander ? Icon(Icons.keyboard_arrow_down,) : Icon(Icons.keyboard_arrow_down,color: Color(0xff00AEA8),),
          ],
        ),
      ),
    );
  }
}
/////========this is location section =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=--==-==-=-==-=-

class Map extends StatelessWidget {
  final CarDetailsController controller;
  const Map({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 6))],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 5)),
              child: CustomText(textSize: 20, fontWeight: FontWeight.w600, title: ConstString.location),
            ),
            SizedBox(height: AppSize.width(value: 10)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(title: "12b, Lekki Phase 1, Lagos, Nigeria", textSize: 14, fontWeight: FontWeight.w500),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ConstColor.textColor),
                    child: CustomText(
                      textSize: 12,
                      fontWeight: FontWeight.w400,
                      title: '2.2 km away', //controller.distance.toString(), //"2.3 km away",
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.width(value: 6)),

            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                height: AppSize.size.width * 0.5,
                width: AppSize.size.width,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 8, offset: Offset(0, 6))],
                ),
                clipBehavior: Clip.hardEdge,

                child: AppImage(path: "assets/temp/car.png", fit: BoxFit.cover, height: AppSize.size.width * 0.5, width: AppSize.size.width),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/////========this is photo section =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=--==-==-=-==-=-

Widget _imageGrid() {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    physics: const NeverScrollableScrollPhysics(),
    children: [
      _chatImage("assets/images/check_in_car_pic1.png"),
      _chatImage("assets/images/check_in_car_pic2.png"),
      _chatImage("assets/images/check_in_car_pic3.png"),
      _chatImage("assets/images/check_in_car_pic4.png"),
      _chatImage("assets/images/check_in_car_pic1.png"),
      _chatImage("assets/images/check_in_car_pic2.png"),

    ],
  );
}
Widget _chatImage(String path) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      path,
      fit: BoxFit.cover,
    ),
  );
}

/////========this is about section =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=-=--==-==-=-==-=-
  class About extends StatelessWidget {
  final CarDetailsController controller;
  const About({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title:
          'Rent this spacious mid-size SUV in Amsterdam, ideal for both city driving and road trips.It offers plenty of room for passengers and luggage, making it perfect for families or groups. The car features modern amenities, including air conditioning, GPS navigation, and Bluetooth connectivity, ensuring a comfortable and hassle-free ride.',
          textSize: AppSize.width(value: 14),
          fontWeight: FontWeight.w400,
          maxLine: 100,
          top: 10,
          bottom: 17,
        ),
        CustomText(title: '${ConstString.features}:', textSize: AppSize.width(value: 22), fontWeight: FontWeight.w500, bottom: 3),
        FeaturesItem(headers: ConstString.carType, info: 'Compact Sedan'),
        FeaturesItem(headers: ConstString.seats, info: '4'),
        FeaturesItem(headers: ConstString.transmission, info: 'Automatic'),
        FeaturesItem(headers: ConstString.fuelType, info: 'Petrol'),
        FeaturesItem(headers: ConstString.airConditioning, info: 'yes'),
        FeaturesItem(headers: ConstString.gpsNavigation, info: 'yes'),
        FeaturesItem(headers: ConstString.mileage, info: 'Unlimited'),
        FeaturesItem(headers: ConstString.bluetooth, info: 'yes'),
        FeaturesItem(
          headers: ConstString.description,
          info:
          'This compact sedan is perfect for exploring Amsterdam and its surroundings. Featuring a fuel-efficient engine, comfortable seating for up to 4 people, and modern amenities like GPS and Bluetooth, it’s the ideal choice for travelers looking for convenience and comfort. Enjoy a flexible rental period with unlimited mileage, and the peace of mind with included insurance. Pickup and drop-off at a central location for ease.',
        ),
      ],
    );
  }
}

class FeaturesItem extends StatelessWidget {
  final String headers;
  final String info;
  const FeaturesItem({super.key, required this.headers, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width(value: 115),
            child: CustomText(title: headers, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600, textAlign: TextAlign.start),
          ),
          Expanded(child: CustomText(title: info, maxLine: 20)),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final CarDetailsController controller;
  const Buttons({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(controller.buttonTitles.length, (index) {
        return CustomElevatedButton(
          elevation: 0,
          color: controller.currentIndex == index ? ConstColor.textColor : Colors.white,
          height: 32,
          width: 0,
          horizontal: AppSize.width(value: 16),
          onPressed: () {
            //-=-=-==- Handle button actions by index-=-=-=-=-=-=-=
            switch (index) {
              case 0:
              // =-=-=-=-=-=-=Navigate to About page-=-=-=-=-=-
                controller.setCurrentButtonIndex(index);
                break;
              case 1:
              //=-=-=-=-=-=-= Navigate to Features page-=-=-=-=-=-=-=-=-=-=
                controller.setCurrentButtonIndex(index);
                break;
              case 2:
              // =-=-==-=-=-=-=-=-=-=-=-=-Navigate to Reviews page-=-=-=-=--=-=-=-=-=-=-=-=-=-=
                controller.setCurrentButtonIndex(index);
                break;
              case 3:
              // =-=-=-=--=-==--=Navigate to Similar page====-==-=-=-=-=--==-=
                controller.setCurrentButtonIndex(index);
                break;
            }
          },
          child: CustomText(
            title: controller.buttonTitles[index],
            textSize: AppSize.width(value: 14),
            fontWeight: FontWeight.w600,
            textColor: controller.currentIndex == index ? Colors.white : ConstColor.textColor,
          ),
        );
      }),
    );
  }
}

class CarLocationAndName extends StatelessWidget {
  const CarLocationAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            children: [
              SvgPicture.asset(ConstIcons.locationIcon, width: 15),
              SizedBox(width: 4),
              CustomText(textSize: AppSize.width(value: 16), fontWeight: FontWeight.w400, textColor: ConstColor.textColor, title: "Dugbe, Ibadan"),
            ],
          ),
        ),
        CustomText(
          textSize: AppSize.width(value: 20),
          fontWeight: FontWeight.w600,
          textColor: ConstColor.textColor,
          title:  ConstString.revueltoaV12hybridsupercar,
        ),
      ],
    );
  }
}

class CarImage extends StatelessWidget {
  const CarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), offset: const Offset(0, 3), blurRadius: 3, spreadRadius: 0)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: AppImage(path: DevImageString.hostCar2, height: 234, width: double.infinity, fit: BoxFit.cover),
          ),
        ),

        Positioned(
          top: 14,
          right:10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSize.width(value: 22),
                width: AppSize.width(value: 60),
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                child: Center(child: CustomText(title: ConstString.active,textColor: Colors.white,fontWeight: FontWeight.bold,))
              ),
              SizedBox(width: AppSize.width(value: 8)),
              Container(
                height: AppSize.width(value: 22),
                width: AppSize.width(value: 25),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                child: Icon(Icons.more_vert, color: Colors.black, size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
