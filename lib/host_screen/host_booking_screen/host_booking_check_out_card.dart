import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_connect/utils/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/const_color.dart';
import '../../constant/const_icons.dart';
import '../../constant/const_string.dart';
import '../../custom_widgets/app_image/app_image.dart';
import '../../custom_widgets/custom_elevated_button.dart';
import '../../custom_widgets/text/custom_text.dart';
import '../../screens/booking_details_screen/booking_details_page.dart';
import '../../utils/app_size.dart';

class HostBookingCheckOutCard extends StatelessWidget {
  const HostBookingCheckOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ConstColor.cardBorderColour),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: AppImage(
                      path: 'assets/temp/bookigcar.png',
                      height: AppSize.width(value: 170),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomText(
                        title: ConstString.checkOut,
                        textSize: AppSize.width(value: 14),
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
      
              CustomText(title: 'Revuelto (a V12 hybrid supercar)', textSize: AppSize.width(value: 21), fontWeight: FontWeight.w600),
      
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(left: 5, title:ConstString.guestJohnAnderson, textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400),
                    Spacer(),
                    CustomText(title: '120/Total', textSize: AppSize.width(value: 16), textColor: ConstColor.primaryColor, fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              // this is my booking info call =====================================>>>>>>>>>>>>>>>>>>>>>
              _BookingInfo(),
              SizedBox(height: 20,),
      
              // this one is call now button=================================================////////////////////////
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
                        
                                Gap(height: 8,),
                        
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
              //=-===================================================
      
            ],
          ),
        ),
      ),
    );
  }
}

class _BookingInfo extends StatelessWidget {
  const _BookingInfo();

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
            CustomText(title: ConstString.from, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
            CustomText(title: ConstString.to, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12),),
            CustomText(title: '27 Aug, 2025 || 03:00 pm', textSize: AppSize.width(value: 12), ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(title: ConstString.destination, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
            Row(
              children: [
                SvgPicture.asset(ConstIcons.locationIcon),
                CustomText(left: 5, title: ConstString.californiaUSA, textSize: AppSize.width(value: 14), fontWeight: FontWeight.w600),
              ],
            ),
          ],
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
