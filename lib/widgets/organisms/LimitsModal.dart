import 'package:flutter/material.dart';
import 'package:app/api/ApiGps.dart';
import 'package:app/api/apiCars.dart';
import 'dart:convert';

import 'package:app/widgets/molecules/SliderInput.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

import 'package:app/styles/colors.dart' as app_colors;

typedef void GeofenceCallback(double val);

class AppLimitsModal extends StatefulWidget {
  final String token;
  final int carId;
  final GeofenceCallback onGeofenceChanged;

  const AppLimitsModal({
    super.key,
    required this.carId,
    required this.token,
    required this.onGeofenceChanged
  });

  @override
  State<AppLimitsModal> createState() => _AppLimitsModalState();
}

class _AppLimitsModalState extends State<AppLimitsModal> {
    final ApiGps gpsHandler = ApiGps();
    final ApiCars carsHandler = ApiCars();
    late double? geofenceValue = 5.00;
    late double? velocityValue = 10.00;

  @override
  void initState() {
    super.initState();
    fetchData(widget.carId, widget.token);
  }

  void fetchData(int? carId, String? token) async {
    var gpsRes = await gpsHandler.getGpsInfo(carId!, token!);
    var car = await carsHandler.getCarById(widget.carId.toString(), widget.token);

    if (gpsRes.body != null && car.body != null) {
      setState(() {
        velocityValue = jsonDecode(car.body)["velocityLimit"] == null ? 10.0 : double.parse(jsonDecode(car.body)["velocityLimit"].toString());
        geofenceValue = jsonDecode(gpsRes.body)["geofenceRadiusKm"] == null ? 5.0 : double.parse(jsonDecode(gpsRes.body)["geofenceRadiusKm"].toString());
      });
    }
  }

  void updateGeofence(double? val) async {
    setState(() {
      geofenceValue = val;
    });
    widget.onGeofenceChanged(val!);
  }

  void updateVelocity(double? val) async {
    setState(() {
      velocityValue = val;
    });
  }

  void updateGeofenceVelocity () async {
    var gpsGeofence = await gpsHandler.updateCarGeofence(widget.carId, widget.token, geofenceValue!.toInt());
    var carVelocity = await carsHandler.updateCarVelocity(widget.carId, widget.token, velocityValue!.toInt());

    if (gpsGeofence.body != null || carVelocity.body != null) {
      debugPrint('Succeded updates');
    } else {
      debugPrint('Errored updates');
    }

    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: app_colors.background,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppTypography(
            text: "Modificar límites",
            color: app_colors.primary,
            align: TextAlign.center,
            type: "h2",
          ),
          const SizedBox(
            height: 24,
          ),
          AppSliderInput(
            label: "Editar rango de geocerca",
            minText: "1 km",
            minValue: 1,
            maxText: "50 km",
            maxValue: 50,
            initialValue: geofenceValue!,
            onValueChanged: updateGeofence
          ),
          const SizedBox(
            height: 24,
          ),
          AppSliderInput(
            label: "Editar velocidad máxima",
            minText: "10 km",
            minValue: 10,
            maxText: "150 km",
            maxValue: 150,
            initialValue: velocityValue!,
            onValueChanged: updateVelocity
          ),
          const SizedBox(
            height: 28,
          ),
          AppButton(text: "Aceptar", onPressed: () => updateGeofenceVelocity()),
        ],
      ),
    );
  }
}
