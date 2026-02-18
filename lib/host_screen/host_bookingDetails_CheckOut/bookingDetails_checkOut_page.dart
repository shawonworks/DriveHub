import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/cancle_pop_up.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/feedback_pop_up/give_feedback_pop_up.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class BookingDetailsCheckoutPage extends StatelessWidget {
  const BookingDetailsCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBlankWithBackButton(ConstString.bookingDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
          child: Column(
            children: [ CarInfo(), BookingInfo(), Map(), HostInfo(), DriverDetails(), TransectionDetails(), BottomButton()],
          ),
        ),
      ),
    );
  }
}

class DottedLineCustom extends StatelessWidget {
  final double? top;
  final double? bottom;
  const DottedLineCustom({super.key, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top ?? 0.0, bottom: bottom ?? 0.0),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: ConstColor.cardBorderColour,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return true ? CheckOut() : CheckIN();
  }
}

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              CustomText(title: '${ConstString.checkIn} ${ConstString.details}', textSize: AppSize.width(value: 16), fontWeight: FontWeight.w500),
              Spacer(),
              Icon(Icons.keyboard_arrow_right_rounded),
            ],
          ),
        ),
        CustomElevatedButton(
          top: 0,
          bottom: 20,
          height: 56,
          elevation: 0,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  
                          // Close button (top right)
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(Icons.close, size: 22),
                            ),
                          ),
                  
                          Gap(height: 10,),
                  
                          // Top Icon
                          Image.asset('assets/icons/rateAppExperienceIcon.png'),
                          Gap(height: 12,),
                  
                          // Title
                          Text(
                            ConstString.giveYourRating,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                  
                          Gap(height: 8,),
                  
                          // Stars
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingStar()
                              ],
                            ),
                          ),
                  
                          Gap(height: 16,),
                  
                          // Write your feedback
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(ConstString.writeYourFeedback,
                              style: TextStyle(
                                fontSize: 16,
                                color: ConstColor.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                  
                          Gap(height: 8,),
                  
                          // Feedback box
                          TextField(
                            maxLines: 3,
                            decoration: InputDecoration(
                             hintText: ConstString.giveYourFeedbackHere,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Gap(height: 18,),
                  
                          // Submit button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: AppSize.size.width*0.3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ConstColor.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                  child: Text(
                                    ConstString.submit,
                                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },

          color: ConstColor.primaryColor,
          child: CustomText(
            title: ConstString.giveYourRating,
            fontWeight: FontWeight.w400,
            textColor: Colors.white,
            textSize: AppSize.width(value: 18),
          ),
        ),

        Gap(height: 5,),
        CustomElevatedButton(
          top: 0,
          bottom: 20,
          height: 56,
          elevation: 0,
          onPressed: () {
          Get.toNamed(AppRoutes.hostCheckOutPage);
          },
          isoutLined: true,
          color: ConstColor.white,
          outLineColour: Colors.grey,
          borderWidth: 2,
          child: CustomText(title: ConstString.viewCheckOut, fontWeight: FontWeight.w400, textColor: Color(0xff626262), textSize: AppSize.width(value: 18)),
        ),
        Gap(height: 20,),

      ],
    );
  }
}

class CheckIN extends StatelessWidget {
  const CheckIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          top: 0,
          height: 56,
          elevation: 0,
          onPressed: () {
            Get.toNamed(AppRoutes.checkIN);
          },
          color: ConstColor.primaryColor,

          child: CustomText(title: ConstString.checkIn, fontWeight: FontWeight.w400, textColor: Colors.white, textSize: AppSize.width(value: 18)),
        ),

        CustomElevatedButton(
          top: 0,
          bottom: 10,
          height: 56,
          elevation: 0,
          onPressed: () => canclePopUp(context),
          color: Colors.transparent,
          child: CustomText(title: ConstString.cancle, fontWeight: FontWeight.w400, textColor: Colors.red, textSize: AppSize.width(value: 18)),
        ),
      ],
    );
  }
}

class TransectionDetails extends StatelessWidget {
  const TransectionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DottedLineCustom(top: 12, bottom: 12),
        CustomText(
          title: '${ConstString.transaction} ${ConstString.details}',
          textSize: AppSize.width(value: 18),
          fontWeight: FontWeight.w500,
          bottom: 3,
        ),
        DetailsItem(headers: ConstString.status, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.totalAmount, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.paymentMethod, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.date, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.transactionId, info: 'Amsterdam, Netherlands'),
        SizedBox(height: 10),
      ],
    );
  }
}

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: ConstString.details, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w500, bottom: 3),
        DetailsItem(headers: ConstString.fullName, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.phoneNumber, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.email, info: 'Amsterdam, Netherlands'),
        DetailsItem(headers: ConstString.licenseNumber, info: 'Amsterdam, Netherlands'),
      ],
    );
  }
}

class DetailsItem extends StatelessWidget {
  final String headers;
  final String info;
  const DetailsItem({super.key, required this.headers, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width(value: 115),
            child: CustomText(
              title: headers,
              textSize: AppSize.width(value: 12),
              fontWeight: FontWeight.w400,
              textColor: ConstColor.cardBorderColour,
              textAlign: TextAlign.start,
            ),
          ),
          CustomText(title: info, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w500, maxLine: 20),
        ],
      ),
    );
  }
}

class HostInfo extends StatelessWidget {
  const HostInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DottedLineCustom(top: 12, bottom: 12),
        CustomText(bottom: 12, title: ConstString.hostedBy, textSize: AppSize.width(value: 18), fontWeight: FontWeight.w500),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImageCircular(path: "assets/temp/profile.png", width: AppSize.width(value: 45), height: AppSize.width(value: 45)),
            Gap(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(left: 6, title: 'Samuel', textSize: AppSize.width(value: 16), fontWeight: FontWeight.w500),
                Row(
                  children: [
                    SvgPicture.asset(ConstIcons.locationIcon),
                    CustomText(left: 5, title: 'California, USA', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
                  ],
                ),
              ],
            ),
            Spacer(),
            CustomElevatedButton(
              top: 0,
              elevation: 0,
              height: 32,
              width: 0,
              color: ConstColor.textColor,
              onPressed: () {},
              child: CustomText(title: ConstString.message, fontWeight: FontWeight.w500, textColor: Colors.white, textSize: AppSize.width(value: 10)),
            ),
          ],
        ),
        DottedLineCustom(top: 12, bottom: 12),
      ],
    );
  }
}

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 10),
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 6))],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(color: ConstColor.cardBorderColour),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              textSize: 20,
              fontWeight: FontWeight.w600,
              title: ConstString.location, //AppString.location,
            ),
            SizedBox(height: AppSize.width(value: 10)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: "12b, Lekki Phase 1, Lagos, Nigeria",
                  textSize: 14,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ConstColor.textColor),
                  child: CustomText(
                    textSize: 12,
                    fontWeight: FontWeight.w400,
                    title: '2.2 km away',
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.width(value: 6)),

            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 6))],
                ),
                clipBehavior: Clip.hardEdge,
                child: AppImage(height: 200, width: double.infinity, path: "assets/temp/location_map.png"),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingInfo extends StatelessWidget {
  const BookingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DottedLineCustom(top: 12, bottom: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: ConstString.from, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
            CustomText(title: ConstString.to, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: ConstString.destination, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w600),
            Row(
              children: [
                SvgPicture.asset(ConstIcons.locationIcon),
                CustomText(left: 5, title: 'California, USA', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
              ],
            ),
          ],
        ),
        DottedLineCustom(top: 12, bottom: 12),
      ],
    );
  }
}

class CarInfo extends StatelessWidget {
  const CarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(6),
          child: AppImage(path: 'assets/temp/black_car.png', height: AppSize.width(value: 170), width: double.infinity, fit: BoxFit.cover),
        ),
        CustomText(title: 'Revuelto (a V12 hybrid supercar)', textSize: AppSize.width(value: 21), fontWeight: FontWeight.w600),
        Row(
          children: [
            CustomText(title: '5.0 ⭐ ', textSize: AppSize.width(value: 13), fontWeight: FontWeight.w400),
            CustomText(title: '(15 Trips) ', textSize: AppSize.width(value: 13), fontWeight: FontWeight.w400),
            SvgPicture.asset(ConstIcons.carsIcon),
            CustomText(title: ' With Driver', textSize: AppSize.width(value: 13), fontWeight: FontWeight.w400),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Row(
            children: [
              SvgPicture.asset(ConstIcons.locationIcon),
              CustomText(left: 5, title: 'Santa Ana', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
              CustomText(title: ' • ', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
              CustomText(title: '32.5 miles', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Row(
            children: [
              SvgPicture.asset(ConstIcons.calendarIcon),
              CustomText(left: 5, title: 'Sep 25-28', textSize: AppSize.width(value: 11), fontWeight: FontWeight.w400),
              Spacer(),
              CustomText(title: '\$ 120/Total', textSize: AppSize.width(value: 15), fontWeight: FontWeight.w600),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingStar extends StatefulWidget {
  final int maxStars;
  final double starSize;
  final Color filledColor;
  final Color borderColor;
  final List<bool>? initialStates; //  initial each star

  const RatingStar({
    super.key,
    this.maxStars = 5,
    this.starSize = 40,
    this.filledColor = Colors.amber,
    this.borderColor = Colors.amber,
    this.initialStates,
  });

  @override
  State<RatingStar> createState() => _IndividualStarRatingState();
}

class _IndividualStarRatingState extends State<RatingStar> {
  late List<bool> starStates;

  @override
  void initState() {
    super.initState();
    if (widget.initialStates != null && widget.initialStates!.length == widget.maxStars) {
      starStates = List.from(widget.initialStates!);
    }
    else {
      starStates = List.generate(widget.maxStars, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // Toggle only this star
              starStates[index] = !starStates[index];
            });
          },
          child: Icon(
            starStates[index] ? Icons.star : Icons.star_border,
            color: starStates[index] ? widget.filledColor : widget.borderColor,
            size: widget.starSize,
          ),
        );
      }),
    );
  }
}
