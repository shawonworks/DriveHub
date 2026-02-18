import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HostInboxScreenController extends GetxController {
  TextEditingController textController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? inboxImagePath;

  List<Inbox> chatMessages = [
    Inbox(userImagePath: 'assets/temp/profile.png', userID: '0', message: 'how are you sifat?', time: '09:01 am'),
    Inbox(userImagePath: 'assets/temp/profile.png', userID: 'any', message: 'im fine and you ?', time: '09:01 am'),
    Inbox(userImagePath: 'assets/temp/profile.png', userID: '0', message: 'Fine, I really the house.', time: '09:01 am'),
    Inbox(userImagePath: 'assets/temp/profile.png', userID: 'any', message: 'My Pleasure dear.', time: '09:01 am'),
    Inbox(
      userImagePath: 'assets/temp/profile.png',
      userID: '0',
      message: 'okay, so there some issues with my car..a the door lock doesn\'t work.',
      time: '09:02 am',
    ),
    Inbox(userImagePath: 'assets/images/car.png', userID: '0', message: 'how are you kamila?', time: '09:01 am'),
    Inbox(userImagePath: 'assets/images/car.png', userID: 'any', message: 'im fine and you ?', time: '09:01 am'),
    Inbox(userImagePath: 'assets/images/car.png', userID: '0', message: 'Fine, I really the house.', time: '09:01 am'),
    Inbox(userImagePath: 'assets/images/car.png', userID: 'any', message: 'My Pleasure dear.', time: '09:01 am'),
    Inbox(
      userImagePath: 'assets/images/car.png',
      userID: '0',
      message: 'okay, so there some issues with my car..a the door lock doesn\'t work.',
      time: '09:02 am',
    ),
    Inbox(userImagePath: 'assets/images/car.png', userID: '0', message: 'how are you kamila?', time: '09:01 am'),
    Inbox(userImagePath: 'assets/images/car.png', userID: 'any', message: 'im fine and you ?', time: '09:01 am'),
    Inbox(userImagePath: 'assets/images/car.png', userID: '0', message: 'Fine, I really the house.', time: '09:01 am'),
    Inbox(userImagePath: 'assets/images/car.png', userID: 'any', message: 'My Pleasure dear.', time: '09:01 am'),
    Inbox(
      userImagePath: 'assets/images/car.png',
      userID: '0',
      message: 'okay, so there some issues with my car..a the door lock doesn\'t work.',
      time: '09:02 am',
    ),
  ];

  String myID = '0';

  Future<void> pickPhotoFromGallery() async {
    await _pickImage((path) {
      inboxImagePath = path;
      print('$inboxImagePath');
    });
    update();
  }

  Future<void> _pickImage(Function(String?) onImagePicked) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery,maxWidth: 1800, maxHeight:  1800, imageQuality:  85);

      if (image != null) {
        onImagePicked(image.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void sendMessage() {
    chatMessages.insert(0, Inbox(userImagePath: 'assets/images/car.png', message: textController.text, userID: '0', time: DateTime.now().toString()));
    textController.clear();
    update();
  }

  void sendMessageAnotherGuy() {
    chatMessages.insert(
      0,
      Inbox(userImagePath: 'assets/images/car.png', message: textController.text, userID: 'any', time: DateTime.now().toString()),
    );
    textController.clear();
    update();
  }
}

class Inbox {
  final String userImagePath;
  final String userID;
  final String? message;
  final String? image;
  final String time;

  Inbox({required this.userImagePath, required this.userID, this.message, this.image, required this.time});
}
