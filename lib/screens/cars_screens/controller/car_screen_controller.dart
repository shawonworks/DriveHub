import 'package:get/get.dart';

class CarScreenController extends GetxController {
  RxString selectedDropdown = "Cars with driver".obs;
  List<String> dropdownVAlue = ["Cars with driver", "Cars without driver"];
}
