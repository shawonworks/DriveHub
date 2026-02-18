import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/check_in_screen/controller/check_in_controller.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/custom_widgets/appbar_blank_back_button.dart';
import 'package:go_connect/custom_widgets/custom_elevated_button.dart';
import 'package:go_connect/custom_widgets/text/custom_text.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CheckInController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: CustomElevatedButton(
            top: 0,
            right: 12,
            left: 12,
            bottom: 20,
            height: 56,
            elevation: 0,
            onPressed: () {},
            color: ConstColor.primaryColor,

            child: CustomText(title: ConstString.send, fontWeight: FontWeight.w400, textColor: Colors.white, textSize: AppSize.width(value: 18)),
          ),
          appBar: appBarBlankWithBackButton(ConstString.checkIn),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: ConstString.readyCheckIn, textSize: AppSize.width(value: 20), fontWeight: FontWeight.w600, top: 7),
                  CustomText(top: 7, bottom: 7, title: ConstString.uploadPicture, textSize: AppSize.width(value: 16), fontWeight: FontWeight.w600),

                  MultiImagePickerView(
                    controller: controller.controller,
                    builder: (BuildContext context, ImageFile imageFile) {
                      // here returning DefaultDraggableItemWidget. You can also return your custom widget as well.
                      return DefaultDraggableItemWidget(
                        imageFile: imageFile,
                        boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        closeButtonAlignment: Alignment.topRight,
                        fit: BoxFit.cover,
                        closeButtonIcon: const Icon(Icons.cancel, color: Colors.black),
                        closeButtonBoxDecoration: null,
                        showCloseButton: true,
                        closeButtonMargin: const EdgeInsets.all(3),
                        closeButtonPadding: const EdgeInsets.all(3),
                      );
                    },
                    initialWidget: DefaultInitialWidget(
                      centerWidget: Icon(Icons.image_search_outlined),
                      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.05),
                      margin: EdgeInsets.zero,
                    ), // Use any Widget or DefaultInitialWidget. Use null to hide initial widget
                    addMoreButton: DefaultAddMoreWidget(
                      icon: Icon(Icons.image_search_outlined),
                      // backgroundColor: Theme.of(context).colorScheme.primaryColor.withOpacity(0.2),
                    ), // Use any Widget or DefaultAddMoreWidget. Use null to hide add more button.
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.47,
                    ),
                    draggable: true,
                    /* true or false, images can be reordered by dragging by user or not, default true */
                    shrinkWrap: true,
                    /* true or false, to control GridView's shrinkWrap */
                    longPressDelayMilliseconds: 300,
                    /* time to press and hold to start dragging item */
                    onDragBoxDecoration: BoxDecoration(),
                    /* BoxDecoration when item is dragging */
                    // padding: EdgeInsets.symmetric(horizontal: ) /* GridView padding */,
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

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_connect/check_in_screen/controller/check_in_controller.dart';
// import 'package:go_connect/constant/const_string.dart';
// import 'package:go_connect/custom_widget/appbar_blank_back_button.dart';
// import 'package:go_connect/custom_widget/custom_text.dart';
// import 'package:go_connect/utils/appSize.dart';
// import 'package:multi_image_picker_view/multi_image_picker_view.dart';

// class CheckInPage extends StatelessWidget {
//   const CheckInPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CheckInController>(
//       init: CheckInController(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: appBarBlankWithBackButton(ConstString.checkIn),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     title: ConstString.readyCheckIn,
//                     textSize: AppSize.width(value: 20),
//                     fontWeight: FontWeight.w600,
//                   ),
//                   const SizedBox(height: 16),
//                   CustomText(
//                     title: ConstString.uploadPicture,
//                     textSize: AppSize.width(value: 16),
//                     fontWeight: FontWeight.w600,
//                   ),
//                   const SizedBox(height: 16),

//                   MultiImagePickerView(
//                     controller: controller.controller,
//                     builder: (BuildContext context, ImageFile imageFile) {
//                       return DefaultDraggableItemWidget(
//                         imageFile: imageFile,
//                         boxDecoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         closeButtonAlignment: Alignment.topRight,
//                         fit: BoxFit.cover,
//                         closeButtonIcon: const Icon(Icons.cancel, color: Colors.red),
//                         closeButtonBoxDecoration: null,
//                         showCloseButton: true,
//                         closeButtonMargin: const EdgeInsets.all(3),
//                         closeButtonPadding: const EdgeInsets.all(3),
//                       );
//                     },
//                     initialWidget: DefaultInitialWidget(
//                       centerWidget: const Icon(Icons.image_search_outlined),
//                       backgroundColor: Theme.of(
//                         context,
//                       ).colorScheme.secondary.withOpacity(0.05),
//                       margin: EdgeInsets.zero,
//                     ),
//                     addMoreButton: DefaultAddMoreWidget(
//                       icon: const Icon(Icons.image_search_outlined),
//                     ),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 16,
//                       mainAxisSpacing: 12,
//                       childAspectRatio: 1.47,
//                     ),
//                     draggable: true,
//                     shrinkWrap: true,
//                     longPressDelayMilliseconds: 300,
//                     onDragBoxDecoration: const BoxDecoration(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
