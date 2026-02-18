import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CarsHostScreenController extends GetxController {
  RxBool addCars = false.obs;

  Map<String, dynamic> carImages = {};

  void saveCarImages(Map<String, dynamic> images) {
    carImages = images;
    addCars.value = true;
    update();
  }

  void addCarsUiUpdate() {
    addCars.value = true;
    update();
  }
}
