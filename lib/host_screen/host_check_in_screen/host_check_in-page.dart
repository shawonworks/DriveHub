import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:go_connect/host_screen/host_check_in_screen/controller/host_check_in_controller.dart';

import '../../constant/const_icons.dart';

class HostCheckInPage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  HostCheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Check - In",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // ----------------------- Profile Section -----------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("assets/images/check_in_profile.png"),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "John Anderson",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Lamborghini Aventador",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 10),
          const Divider(height: 1),

          // ----------------------- Chat Messages -----------------------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ----- Sender message -----
                  _senderMessage("Hi! I’ve arrived and ready for check-in."),
                  _timeStamp("03:24 PM"),

                  const SizedBox(height: 12),

                  // ----- 2×2 Image Grid -----
                  _imageGrid(),

                  const SizedBox(height: 12),

                  _senderMessage(
                    "Here are the check-in photos showing the car condition.",
                  ),
                  _timeStamp("03:54 PM"),

                  const SizedBox(height: 12),

                  // ----- Receiver message -----
                  _receiverMessage(
                    "Great! Everything looks good. Have a safe trip!",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _timeStamp("04:09 PM"),
                  ),
                ],
              ),
            ),
          ),

          // ----------------------- Message Input Field -----------------------
          _bottomMessageBar(messageController),
        ],
      ),
    );
  }

  // ------------------------------------------------
  // Sender message (white bubble)
  Widget _senderMessage(String msg) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 80),
      child: Text(
        msg,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  // ------------------------------------------------
  // Receiver message (green bubble)
  Widget _receiverMessage(String msg) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff009689),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 80),
        child: Text(
          msg,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  // ------------------------------------------------
  // Timestamp
  Widget _timeStamp(String time) {
    return Text(
      time,
      style: TextStyle(
        fontSize: 11,
        color: Colors.grey.shade500,
      ),
    );
  }

  // ------------------------------------------------
  // 2×2 Image Grid
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

  // ------------------------------------------------
  // Bottom Message Bar
  Widget _bottomMessageBar(TextEditingController controller) {
    return GetBuilder(
      init: HostCheckInController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffDEF4F3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,


                      prefixIcon:  InkWell(
                        onTap: () => controller.pickPhotoFromGallery(),
                        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6.0), child: SvgPicture.asset(ConstIcons.inboxImageUploadIcon)),
                      ),

                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Send Button
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xff009689),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),

        );
      }
    );
  }
}
