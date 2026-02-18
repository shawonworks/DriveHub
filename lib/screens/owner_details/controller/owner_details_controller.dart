import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';

class OwnerDetailsController extends GetxController {
  List<String> verifiedInfoList = [
    ConstString.approved,
    ConstString.phoneNumber,
    ConstString.email,
  ];
}
