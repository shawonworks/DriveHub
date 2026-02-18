import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> createAccountValidKey = GlobalKey<FormState>();
}
