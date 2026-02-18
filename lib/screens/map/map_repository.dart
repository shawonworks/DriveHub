// lib/repositories/location_repository.dart
import 'package:get/get.dart';
import 'package:go_connect/screens/map/location_model.dart';

class LocationRepository extends GetxService {
  // This method will send the selected location to your backend
  Future<bool> sendLocationToBackend(LocationModel location) async {
    try {
      // Replace this with your actual API call
      print('Sending to backend: ${location.toJson()}');

      // Simulate API call
      await Future.delayed(Duration(seconds: 1));

      // Example API call structure:
      // final response = await dio.post('/api/user-location', data: location.toJson());
      // return response.statusCode == 200;

      return true; // Simulate success
    } catch (e) {
      print('Error sending location: $e');
      return false;
    }
  }

  // Get recent locations from backend (dummy data for now)
  Future<List<LocationModel>> getRecentLocations() async {
    try {
      // Simulate API call delay
      await Future.delayed(Duration(milliseconds: 500));

      // Dummy data - replace with actual API call
      return [
        LocationModel(locationString: "5 Aso Rock Villa, Central District, Abuja", latitude: 9.082270, longitude: 7.120735),
        LocationModel(locationString: "3 Cocoa House, Dugbe, Ibadan", latitude: 7.501690, longitude: 3.867353),
        LocationModel(locationString: "7 MCC Road, Calabar, Cross River", latitude: 5.044270, longitude: 8.432019),
      ];
    } catch (e) {
      print('Error fetching recent locations: $e');
      return [];
    }
  }
}
