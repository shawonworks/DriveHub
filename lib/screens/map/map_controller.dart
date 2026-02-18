// lib/controllers/location_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/screens/map/location_model.dart';
import 'package:go_connect/screens/map/map_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  final LocationRepository _repository = Get.put(LocationRepository());
  // final LocationRepository _repository = Get.find<LocationRepository>();

  // Google Maps Controller
  GoogleMapController? mapController;

  // Reactive variables
  final RxBool isLoading = false.obs;
  final RxBool isLocationServiceEnabled = false.obs;
  final RxString searchQuery = ''.obs;
  final RxString selectedLocationString = 'Select your location'.obs;

  // Map related variables
  final Rx<LatLng> currentPosition = LatLng(6.4541, -3.3947).obs; // Default to Lagos
  final Rx<LatLng> selectedPosition = LatLng(6.4541, -3.3947).obs;
  final RxSet<Marker> markers = <Marker>{}.obs;

  // Recent locations
  final RxList<LocationModel> recentLocations = <LocationModel>[].obs;

  // Text editing controller for search
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initializeLocation();
    _loadRecentLocations();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // Initialize location services
  Future<void> _initializeLocation() async {
    await _checkLocationPermission();
    if (isLocationServiceEnabled.value) {
      await getCurrentLocation();
    }
  }

  // Check and request location permissions
  Future<void> _checkLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      isLocationServiceEnabled.value = false;
      Get.snackbar(
        'Location Service',
        'Location services are disabled. Please enable location services.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLocationServiceEnabled.value = false;
        Get.snackbar(
          'Location Permission',
          'Location permissions are denied',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      isLocationServiceEnabled.value = false;
      Get.snackbar(
        'Location Permission',
        'Location permissions are permanently denied. Please enable in settings.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLocationServiceEnabled.value = true;
  }

  // Get current location
  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      LatLng newPosition = LatLng(position.latitude, position.longitude);
      currentPosition.value = newPosition;
      selectedPosition.value = newPosition;

      await _updateLocationString(newPosition);
      _updateMapMarker(newPosition);

      // Move map to current location
      if (mapController != null) {
        await mapController!.animateCamera(CameraUpdate.newLatLngZoom(newPosition, 15));
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to get current location: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Update location string from coordinates
  Future<void> _updateLocationString(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String locationStr = '';

        if (place.street != null && place.street!.isNotEmpty) {
          locationStr += place.street!;
        }
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          locationStr += locationStr.isNotEmpty ? ', ${place.subLocality}' : place.subLocality!;
        }
        if (place.locality != null && place.locality!.isNotEmpty) {
          locationStr += locationStr.isNotEmpty ? ', ${place.locality}' : place.locality!;
        }
        if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
          locationStr += locationStr.isNotEmpty ? ', ${place.administrativeArea}' : place.administrativeArea!;
        }

        selectedLocationString.value = locationStr.isNotEmpty ? locationStr : 'Unknown Location';
      }
    } catch (e) {
      print('Error getting location string: $e');
      selectedLocationString.value = 'Location: ${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
    }
  }

  // Update map marker
  void _updateMapMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('selected_location'),
        position: position,
        draggable: true,
        onDragEnd: (LatLng newPosition) {
          onMapTapped(newPosition);
        },
      ),
    );
  }

  // Handle map tap
  Future<void> onMapTapped(LatLng position) async {
    selectedPosition.value = position;
    await _updateLocationString(position);
    _updateMapMarker(position);
  }

  // Handle map long press (pin location)
  Future<void> onMapLongPressed(LatLng position) async {
    selectedPosition.value = position;
    await _updateLocationString(position);
    _updateMapMarker(position);

    Get.snackbar(
      'Location Pinned',
      'Location pinned successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }

  // Use current location button
  Future<void> useCurrentLocation() async {
    await getCurrentLocation();
  }

  // Search location
  Future<void> searchLocation(String query) async {
    if (query.trim().isEmpty) return;

    try {
      isLoading.value = true;
      List<Location> locations = await locationFromAddress(query);

      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng newPosition = LatLng(location.latitude, location.longitude);

        selectedPosition.value = newPosition;
        await _updateLocationString(newPosition);
        _updateMapMarker(newPosition);

        // Move map to searched location
        if (mapController != null) {
          await mapController!.animateCamera(CameraUpdate.newLatLngZoom(newPosition, 15));
        }

        // Clear search
        searchController.clear();
        searchQuery.value = '';
      } else {
        Get.snackbar(
          'Location Not Found',
          'Could not find the specified location',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Search Error',
        'Failed to search location: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Select recent location
  Future<void> selectRecentLocation(LocationModel location) async {
    LatLng position = LatLng(location.latitude, location.longitude);
    selectedPosition.value = position;
    selectedLocationString.value = location.locationString;
    _updateMapMarker(position);

    // Move map to selected location
    if (mapController != null) {
      await mapController!.animateCamera(CameraUpdate.newLatLngZoom(position, 15));
    }
  }

  // Load recent locations
  Future<void> _loadRecentLocations() async {
    try {
      final locations = await _repository.getRecentLocations();
      recentLocations.assignAll(locations);
    } catch (e) {
      print('Error loading recent locations: $e');
    }
  }

  // Confirm location and send to backend
  Future<void> confirmLocation() async {
    try {
      isLoading.value = true;

      LocationModel locationData = LocationModel(
        locationString: selectedLocationString.value,
        latitude: selectedPosition.value.latitude,
        longitude: selectedPosition.value.longitude,
      );

      bool success = await _repository.sendLocationToBackend(locationData);

      if (success) {
        Get.snackbar(
          'Success',
          'Location confirmed successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate back or to next screen
        Get.back(result: locationData);
      } else {
        Get.snackbar(
          'Error',
          'Failed to confirm location. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // Map created callback
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
