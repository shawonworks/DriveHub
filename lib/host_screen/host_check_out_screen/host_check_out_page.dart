import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_string.dart';

class HostCheckOutPage extends StatelessWidget {
  final TextEditingController messageController = TextEditingController();

  HostCheckOutPage({super.key});

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
          ConstString.checkOut,
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
                  backgroundImage: AssetImage("assets/images/check_in_profile.png"), // change this
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      ConstString.johnAnderson,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      ConstString.lamborghiniAventador,
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
                  _senderMessage(ConstString.hiIvArrivedAndReadyForCheckIn),
                  _timeStamp("03:24 PM"),

                  const SizedBox(height: 12),

                  // ----- 2×2 Image Grid -----
                  _imageGrid(),

                  const SizedBox(height: 12),

                  _senderMessage(
                    ConstString.herearethecheckinphotosshowingthecarcondition,
                  ),
                  _timeStamp("03:54 PM"),

                  const SizedBox(height: 12),

                  // ----- Receiver message -----
                  _receiverMessage(
                    ConstString.greatEverythingLooksGoodHaveASafeTrip,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xffDEF4F3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: ConstString.typeHere,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Send Button
          CircleAvatar(
            radius: 24,
            backgroundColor:Color(0xff009689),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
