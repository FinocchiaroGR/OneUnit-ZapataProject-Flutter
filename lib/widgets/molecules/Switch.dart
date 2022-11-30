import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/api/ApiGps.dart';

class AppSwitch extends StatefulWidget {
  final int? carId;
  final String? token;
  final double? geofenceValue;

  const AppSwitch({
    super.key,
    required this.carId,
    required this.token,
    required this.geofenceValue
  });

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  final ApiGps gpsHandler = ApiGps();
  int value = 1;
  Color switchColor = app_colors.primary;

  @override
  void initState() {
    super.initState();
  }

  void onChange(val) {
    setState(() => value = val);
    if (val == 0) {
      activateGeofence(widget.carId!, widget.token!, widget.geofenceValue!.toInt());
    } else if (val == 2) {
      activateGeofence(widget.carId!, widget.token!, 0);
    } else {
      deactivateGeofence(widget.carId!, widget.token!);
    }
  }

  void activateGeofence(int carId, String token, int carGeofence) async {
    var gpsRes = await gpsHandler.activateGeofence(carId, token, carGeofence);

    if (gpsRes.body != null) {
      switchColor = Color.fromARGB(255, 24, 117, 24);
    } else {
      switchColor = Color.fromARGB(255, 112, 31, 16);
    }
  }

  void deactivateGeofence(int carId, String token) async {
    var gpsRes = await gpsHandler.deactivateGeofence(carId, token);

    if (gpsRes.body != null) {
      switchColor = app_colors.primary;
    } else {
      switchColor = Color.fromARGB(255, 112, 31, 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTypography(
          text: 'Selecciona Modo',
          align: TextAlign.center,
          color: Color.fromARGB(255, 14, 14, 19),
          type: 'body1',
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedToggleSwitch<int>.size(
            current: value,
            values: const [0, 1, 2],
            iconOpacity: 1,
            selectedIconOpacity: 1,
            indicatorSize: const Size.square(89.0),
            iconAnimationType: AnimationType.onHover,
            indicatorAnimationType: AnimationType.onHover,
            iconBuilder: (value, size) {
              if (value == 0) {
                return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppTypography(
                    text: 'PARKING',
                    align: TextAlign.center,
                    type: "body2",
                    color: app_colors.secondary,
                  ),
                );
              } else if (value == 1) {
                IconData data = Icons.gpp_bad;
                return Icon(
                  data,
                  size: min(size.width, size.height),
                  color: app_colors.secondary,
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppTypography(
                    text: 'VALET',
                    align: TextAlign.center,
                    type: "body2",
                    color: app_colors.secondary,
                  ),
                );
              }
            },
            height: 40,
            borderWidth: 0.0,
            borderColor: Colors.transparent,
            innerColor: Colors.transparent,
            colorBuilder: (i) {
              return switchColor;
            },
            onChanged: (i) => onChange(i),
          ),
        ]),
      ],
    );
  }
}
