// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// ignore_for_file: library_private_types_in_public_api

import "package:curved_navigation_bar/curved_navigation_bar.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import 'package:flutter/material.dart';

const LatLng currentLoc = LatLng(19.416218, 72.979394);

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController? mapController;
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          mapType: MapType.terrain,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: const CameraPosition(
            target: currentLoc,
            zoom: 12,
          ),
          markers: {Marker(markerId: MarkerId("source"), position: currentLoc)},
        ),
      ),
    );
  }
}

void main() {
  runApp(MapsPage());
}
