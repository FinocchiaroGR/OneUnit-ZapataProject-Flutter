import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:app/styles/colors.dart' as app_colors;

class AppLocationMap extends StatefulWidget {
  final double zoom;
  final double circleRadius;
  final double latitude;
  final double longitude;
  final double geoFenceLatitude;
  final double geoFenceLongitude;
  final bool geofenceActive;
  final String carName;

  const AppLocationMap({
    super.key,
    this.zoom = 16.0,
    this.circleRadius = 100,
    required this.latitude,
    required this.longitude,
    required this.carName,
    required this.geoFenceLatitude,
    required this.geoFenceLongitude,
    required this.geofenceActive
  });

  @override
  State<StatefulWidget> createState() => _AppLocationMapState();
}

class _AppLocationMapState extends State<AppLocationMap> {
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final LatLng center = LatLng(widget.latitude, widget.longitude);
    final LatLng geofenceCenter = LatLng(widget.geoFenceLatitude, widget.geoFenceLongitude);
    final Marker marker = Marker(
      markerId: MarkerId(widget.carName),
      position: center,
      infoWindow:
          InfoWindow(title: 'Aquí esta su auto: ', snippet: widget.carName),
    );

    setState(() {
      markers[MarkerId(widget.carName)] = marker;
    });
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: false,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: Set<Marker>.of(markers.values),
      minMaxZoomPreference: const MinMaxZoomPreference(14, 18),
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: widget.zoom,
      ),
      circles: {
        Circle(
          circleId: const CircleId("wall"),
          center: geofenceCenter,
          radius: widget.circleRadius * 500,
          fillColor: widget.geofenceActive ? app_colors.shadow : app_colors.shadow.withOpacity(0),
          strokeWidth: widget.geofenceActive ? 3 : 0,
        ),
      },
    );
  }
}
