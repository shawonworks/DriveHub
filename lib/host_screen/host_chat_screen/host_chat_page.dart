import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Scaffold, AppBar, Colors, InkWell, RefreshIndicator;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart' show GetNavigation;
import 'package:go_connect/host_screen/host_chat_screen/controller/chat_page_controller.dart';

import '../../constant/const_color.dart';
import '../../constant/const_icons.dart';
import '../../constant/const_string.dart';
import '../../custom_widgets/app_image/app_image_circular.dart';
import '../../custom_widgets/custom_form_field.dart';
import '../../custom_widgets/text/custom_text.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_size.dart';

class HostChatPage extends StatelessWidget {
  const HostChatPage({super.key});

  @override
  Widget build(BuildContext context) {
   return GetBuilder(
       init: HostPageController(),
       builder: (controller){
         return Scaffold(
           appBar: AppBar(
             shadowColor: Colors.white,
             backgroundColor: Colors.white,
             foregroundColor: Colors.white,
             surfaceTintColor: Colors.white,
             toolbarHeight: 110,
             flexibleSpace: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomText(title: ConstString.message, textSize: AppSize.width(value: 26), fontWeight: FontWeight.w700),
                   CustomTextFormField(
                     fromTitle: '',
                     hintText: CustomText(
                       title: ConstString.searchHere,
                       textSize: AppSize.width(value: 16),
                       textColor: ConstColor.cardBorderColour,
                       fontWeight: FontWeight.w300,
                     ),
                     //textController: controller.searchController,
                     validator: (_) => null,
                     prefixIcon: Padding(padding: const EdgeInsets.all(12.0), child: SvgPicture.asset(ConstIcons.searchIcon)),
                   ),
                 ],
               ),
             ),
           ),
           body: RefreshIndicator(
             onRefresh: () async {
               await Future.delayed(Duration(seconds: 2));
             },
             child: ListView.builder(
               padding: EdgeInsets.symmetric(horizontal: 12),
               itemCount: 6,
               itemBuilder: (context, index) => Padding(
                 padding: const EdgeInsets.symmetric(vertical: 6.0),
                 child: InkWell(
                   onTap: () {
                     Get.toNamed(AppRoutes.hostInboxScreenPage);
                   },
                   child: Container(
                     padding: EdgeInsets.all(9.5),
                     child: Row(
                       children: [
                         AppImageCircular(path: 'assets/temp/profile.png', height: 46, width: 46),
                         SizedBox(width: 10),
                         Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             CustomText(title: 'Jack Dawson', textSize: AppSize.width(value: 14), fontWeight: FontWeight.w500),
                             CustomText(
                               title: 'Jack Dawson',
                               textSize: AppSize.width(value: 12),
                               fontWeight: FontWeight.w400,
                               textColor: ConstColor.cardBorderColour,
                             ),
                           ],
                         ),
                         Spacer(),
                         CustomText(
                           title: '09:01 am',
                           textSize: AppSize.width(value: 10),
                           fontWeight: FontWeight.w400,
                           textColor: ConstColor.cardBorderColour,
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
         );

   });
  }
}
