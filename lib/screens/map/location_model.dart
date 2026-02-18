// lib/models/location_model.dart
class LocationModel {
  final String locationString;
  final double latitude;
  final double longitude;

  LocationModel({
    required this.locationString,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'location_string': locationString,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      locationString: json['location_string'] ?? '',
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
    );
  }
}
