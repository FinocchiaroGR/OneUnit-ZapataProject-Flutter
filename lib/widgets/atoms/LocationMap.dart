import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:app/styles/colors.dart' as app_colors;

class AppLocationMap extends StatefulWidget {
  final double zoom;
  final double circleRadius;
  final double latitude;
  final double longitude;

  const AppLocationMap({
    super.key,
    this.zoom = 16.0,
    this.circleRadius = 100,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<StatefulWidget> createState() => _AppLocationMapState();
}

class _AppLocationMapState extends State<AppLocationMap> {
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final LatLng center = LatLng(widget.latitude, widget.longitude);
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      minMaxZoomPreference: const MinMaxZoomPreference(14, 18),
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: widget.zoom,
      ),
      circles: {
        Circle(
          circleId: const CircleId("wall"),
          center: center,
          radius: widget.circleRadius,
          fillColor: app_colors.shadow,
          strokeWidth: 1,
        ),
      },
    );
  }
}
