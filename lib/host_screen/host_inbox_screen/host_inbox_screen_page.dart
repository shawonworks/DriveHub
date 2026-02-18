import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_icons.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/app_image/app_image.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/host_screen/host_inbox_screen/controller/host_inbox_screen_controller.dart';
import 'package:go_connect/screens/inbox_screen.dart/controller/inbox_screen_controller.dart';
import 'package:go_connect/utils/app_size.dart';

import '../../custom_widgets/custom_form_field.dart';
import '../../utils/gap.dart';

class HostInboxScreenPage extends StatelessWidget {
  const HostInboxScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: GestureDetector(onTap: () => Get.back(), child: Icon(Icons.keyboard_arrow_left_rounded)),
        actions: [
          PopupMenuButton(
            padding: EdgeInsetsGeometry.all(0),
            menuPadding: EdgeInsetsGeometry.all(0),
            itemBuilder: (context) => [
              PopupMenuItem(
                padding: EdgeInsets.symmetric(horizontal: AppSize.width(value: 10)),

                value: "Bloc",
                child: CustomText(title: "block Persone"),
              ),
            ],
          ),
        ],
        titleSpacing: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImageCircular(path: 'aassets/temp/profile.png', height: 46, width: 46),
            Gap(height: 10,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: 'Injamam', textSize: AppSize.width(value: 18), fontWeight: FontWeight.w400),
                CustomText(title: 'active now', textSize: AppSize.width(value: 12), fontWeight: FontWeight.w400, textColor: Colors.green),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: _chatInputField(bottomPadding)),
      body: GetBuilder(
        init: HostInboxScreenController(),
        builder: (controller) {
          return ListView.builder(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: controller.chatMessages.length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: controller.myID == controller.chatMessages[index].userID ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                controller.myID == controller.chatMessages[index].userID
                    ? SizedBox.shrink()
                    : Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: AppImageCircular(
                    path: controller.chatMessages[index].userImagePath,
                    height: AppSize.width(value: 30),
                    width: AppSize.width(value: 30),
                  ),
                ),
                Column(
                  crossAxisAlignment: controller.myID == controller.chatMessages[index].userID ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(minWidth: 10, maxWidth: AppSize.width(value: 246)),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: controller.myID == controller.chatMessages[index].userID
                            ? ConstColor.textColor
                            : const Color.fromARGB(87, 0, 150, 135),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: controller.myID == controller.chatMessages[index].userID ? Radius.circular(10) : Radius.circular(0),
                          bottomRight: controller.myID != controller.chatMessages[index].userID ? Radius.circular(10) : Radius.circular(0),
                        ),
                      ),
                      child: controller.chatMessages[index].message == null
                          ? AppImage(path: controller.chatMessages[index].image)
                          : CustomText(
                        title: controller.chatMessages[index].message ?? 'text not load',
                        textColor: controller.myID == controller.chatMessages[index].userID ? Colors.white : ConstColor.textColor,
                        maxLine: 1000,
                      ),
                    ),
                    CustomText(
                      title: controller.chatMessages[index].time,
                      textColor: ConstColor.cardBorderColour,
                      textSize: AppSize.width(value: 8),
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _chatInputField(double bottomPadding) {
    return GetBuilder(
      init: HostInboxScreenController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(left: 12, right: 12, bottom: bottomPadding + 10, top: 10),
          child: SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      hintText: ConstString.typeHere,
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
                InkWell(
                  onTap: () => controller.pickPhotoFromGallery(),
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0), child: SvgPicture.asset(ConstIcons.inboxImageUploadIcon)),
                ),
                InkWell(
                  onTap: () => controller.sendMessage(),
                  child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0), child: SvgPicture.asset(ConstIcons.inboxSendIcon)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
