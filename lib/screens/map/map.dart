// lib/views/location_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/screens/map/map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.put(LocationController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ConstColor.textColor),
          onPressed: () => Get.back(),
        ),
        title: Text(
          ConstString.selectYourlocation, //'Select your Location',
          style: TextStyle(color: ConstColor.textColor, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Fixed Top Section (Search + Current Location Button)
          Container(
            color: Colors.white,
            child: Column(
              children: [
                // Search Section
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: (value) => controller.searchQuery.value = value,
                      onSubmitted: (value) => controller.searchLocation(value),
                      decoration: InputDecoration(
                        hintText: 'Search Location',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                        suffixIcon: Obx(
                          () => controller.searchQuery.value.isNotEmpty
                              ? IconButton(
                                  icon: Icon(Icons.clear, color: Colors.grey[500]),
                                  onPressed: () {
                                    controller.searchController.clear();
                                    controller.searchQuery.value = '';
                                  },
                                )
                              : SizedBox.shrink(),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ),

                // Use Current Location Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: controller.useCurrentLocation,
                      icon: Icon(Icons.my_location, color: Colors.black),
                      label: Text(
                        ConstString.useCurrentLocation, //   'Use Current Location',
                        style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, //Color(0xFFD2691E),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 16),
              ],
            ),
          ),

          // Fixed Map Section
          Container(
            height: MediaQuery.of(context).size.height * 0.35, // Fixed height for map
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: Offset(0, 2))],
            ),
            clipBehavior: Clip.hardEdge,
            child: Obx(
              () => GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(target: controller.currentPosition.value, zoom: 14),
                markers: controller.markers.toSet(),
                onTap: controller.onMapTapped,
                onLongPress: controller.onMapLongPressed,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                mapType: MapType.normal,
              ),
            ),
          ),

          SizedBox(height: 16),

          // Scrollable Bottom Section (Selected Location + Recent Locations)
          // Expanded(
          //   child: SingleChildScrollView(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         // Selected Location Display
          //         Container(
          //           width: double.infinity,
          //           padding: EdgeInsets.all(16),
          //           decoration: BoxDecoration(
          //             color: Colors.grey[50],
          //             borderRadius: BorderRadius.circular(12),
          //             border: Border.all(color: Colors.grey[200]!),
          //           ),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                 children: [
          //                   Icon(Icons.location_on, color: Color(0xFFD2691E), size: 20),
          //                   SizedBox(width: 8),
          //                   Expanded(
          //                     child: Obx(
          //                       () => Text(
          //                         controller.selectedLocationString.value,
          //                         style: TextStyle(
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w500,
          //                           color: Colors.black87,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               SizedBox(height: 4),
          //               Obx(
          //                 () => Text(
          //                   '${controller.selectedPosition.value.latitude.toStringAsFixed(4)}, ${controller.selectedPosition.value.longitude.toStringAsFixed(4)}',
          //                   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),

          //         SizedBox(height: 24),

          //         // Recent Locations Section
          //         Text(
          //           'Recent Locations',
          //           style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w600,
          //             color: Colors.black87,
          //           ),
          //         ),

          //         SizedBox(height: 8),

          //         Obx(
          //           () => Column(
          //             children: controller.recentLocations.map((location) {
          //               return Container(
          //                 margin: EdgeInsets.only(bottom: 8),
          //                 decoration: BoxDecoration(
          //                   border: Border.all(color: Colors.grey[200]!),
          //                   borderRadius: BorderRadius.circular(8),
          //                 ),
          //                 child: ListTile(
          //                   leading: Icon(Icons.location_on, color: Colors.grey[400]),
          //                   title: Text(
          //                     location.locationString,
          //                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          //                   ),
          //                   subtitle: Text(
          //                     '${location.latitude.toStringAsFixed(6)}, ${location.longitude.toStringAsFixed(6)}',
          //                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          //                   ),
          //                   onTap: () => controller.selectRecentLocation(location),
          //                   dense: true,
          //                 ),
          //               );
          //             }).toList(),
          //           ),
          //         ),

          //         // Extra space at bottom to ensure confirm button doesn't overlap
          //         SizedBox(height: 80),
          //       ],
          //     ),
          //   ),
          // ),

          // Fixed Bottom Section (Confirm Location Button)
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.confirmLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ConstColor.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    elevation: 0,
                  ),
                  child: controller.isLoading.value
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2)),
                            SizedBox(width: 8),
                            Text(
                              ConstString.processing, // 'Processing...',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      : Text(
                          ConstString.confirmLocation, // 'Confirm Location',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
