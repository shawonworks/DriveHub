import 'package:get/get.dart';
import 'package:go_connect/constant/const_string.dart';

class ShortByController extends GetxController {
  int selectedIndex = 1;

  List<String> sortOptions = [
    ConstString.relevance,
    ConstString.lowToHigh,
    ConstString.highToLow,
    ConstString.distanceAway,
  ];

  void setIndexNumber(int currentIndex) {
    selectedIndex = currentIndex;
    update();
  }
}

// We need this enum later for backend query params
enum Short {
  relevance('Relevence'),
  lowToHigh('Price(Low to High)'),
  highToLow('Price(High to Low)'),
  distanceAway('Distance Away');

  final String value;
  const Short(this.value);
}
