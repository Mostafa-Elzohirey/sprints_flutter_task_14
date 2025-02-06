import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final List<Marker> _markers = <Marker>[];

  static const CameraPosition _cairo = CameraPosition(
    target: LatLng(30.04445836782833, 31.231849890906698),
    zoom: 12,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(30.04445836782833, 31.231849890906698),
        infoWindow: InfoWindow(
          title: 'Marker Title',
          snippet: 'Marker Description',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: _cairo,
        mapType: MapType.normal,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
