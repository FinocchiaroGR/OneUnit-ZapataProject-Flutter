import 'dart:convert';

import 'package:app/api/ApiGps.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:app/widgets/molecules/Switch.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/LocationMap.dart';
import 'package:app/widgets/atoms/RoundInfo.dart';
import 'package:app/widgets/atoms/RoundButton.dart';
import 'package:app/widgets/molecules/LargeIconButton.dart';
import 'package:app/widgets/organisms/LimitsModal.dart';

import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/styles/colors.dart' as app_colors;
import 'package:provider/provider.dart';

class CarLocation extends StatefulWidget {
  const CarLocation({super.key});

  @override
  State<CarLocation> createState() => _CarLocationState();
}

class _CarLocationState extends State<CarLocation> {
  final ApiGps gpsHandler = ApiGps();
  late bool loading = false;
  late bool error = false;
  late double latitude;
  late double longitude;
  late double? geofenceValue;
  late double? carVelocity;
  late bool active = false;
  Timer? timer;

  late int? carId = Provider.of<UserProvider>(context, listen: false).getIdGPS();
  late String? token =
      Provider.of<UserProvider>(context, listen: false).getToken();

  @override
  void initState() {
    super.initState();
    fetchData(carId, token);
    timer = Timer.periodic(
        const Duration(seconds: 15), (Timer t) => update(carId, token));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void fetchData(int? id, String? token) async {
    setState(() {
      error = false;
      loading = true;
    });

    var gpsRes = await gpsHandler.getGpsInfo(id!, token!);

    if (gpsRes != null) {
      setState(() {
        latitude = jsonDecode(gpsRes.body)["latitude"].toDouble();
        longitude = jsonDecode(gpsRes.body)["longitude"].toDouble();
        carVelocity = jsonDecode(gpsRes.body)["velocity"] == null ? 10.0 : double.parse(jsonDecode(gpsRes.body)["velocity"].toString());
        geofenceValue = jsonDecode(gpsRes.body)["geofenceRadiusKm"] == null ? 5.0 : double.parse(jsonDecode(gpsRes.body)["geofenceRadiusKm"].toString());
        error = false;
        loading = false;
      });
    }
  }

  void update(int? id, String? token) async {
    var gpsRes = await gpsHandler.getGpsInfo(id!, token!);

    if (gpsRes != null) {
      setState(() {
        latitude = jsonDecode(gpsRes.body)["latitude"].toDouble();
        longitude = jsonDecode(gpsRes.body)["longitude"].toDouble();
        carVelocity = jsonDecode(gpsRes.body)["velocity"] == null ? 10.0 : double.parse(jsonDecode(gpsRes.body)["velocity"].toString());
        geofenceValue = jsonDecode(gpsRes.body)["geofenceRadiusKm"] == null ? 5.0 : double.parse(jsonDecode(gpsRes.body)["geofenceRadiusKm"].toString());
        error = false;
        loading = false;
      });
    }
  }

  void updateActiveGeofence (geofence) async {
    setState(() {
      geofenceValue = geofence;
    });
  }

  Future<void> _showLimitsModal(BuildContext context, int id, String token) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AppLimitsModal(
        token: token,
        carId: carId!,
        onGeofenceChanged: updateActiveGeofence
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final double height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            kToolbarHeight +
            kBottomNavigationBarHeight +
            MediaQuery.of(context).viewPadding.top +
            MediaQuery.of(context).viewPadding.bottom);
    return Consumer<UserProvider>(
      builder: (context, list, child) {
        return AppPage(
          title:
              "${list.cars[arguments["idCar"]].brandName} ${list.cars[arguments["idCar"]].modelYear}",
          hasPadding: false,
          body: Column(
            children: [
              Expanded(
                flex: 9,
                child: loading
                    ? const Center(
                        child: SpinKitThreeBounce(
                          color: app_colors.primary,
                        ),
                      )
                    : Stack(
                        children: <Widget>[
                          AppLocationMap(
                            latitude: latitude,
                            longitude: longitude,
                            circleRadius: geofenceValue!,
                            carName:
                                "${list.cars[arguments["idCar"]].brandName} ${list.cars[arguments["idCar"]].modelYear}",
                          ),
                          Positioned(
                            bottom: 24,
                            right: 24,
                            left: 24,
                            child:
                                AppSwitch(
                                  carId: carId, 
                                  token: token,
                                  geofenceValue: geofenceValue,
                                ), // My cards showing in front of the Map's
                          ),
                          Positioned(
                            top: 24,
                            right: 24,
                            child: Column(
                              children: [
                                AppRoundInfo(text: "$carVelocity\nkm/hr"),
                                const SizedBox(height: 8),
                                AppRoundButton(
                                    text: "Edit",
                                    onPressed: () => _showLimitsModal(context, carId!, token!)),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              Expanded(
                child: AppLargeIconButton(
                    icon: app_icons.arrowDown,
                    text: "Información del auto",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        app_urls.carInfo,
                        arguments: arguments["idCar"],
                      );
                      dispose();
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
