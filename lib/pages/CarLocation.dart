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
  late double circleRadius = 10;
  late double carVelocity;
  late double geofenceValue = 0;
  late double velocityValue = 10;
  late bool active = false;
  Timer? timer;

  late int? id = Provider.of<UserProvider>(context, listen: false).getIdGPS();
  late String? token =
      Provider.of<UserProvider>(context, listen: false).getToken();

  @override
  void initState() {
    super.initState();
    fetchData(id, token);
    timer = Timer.periodic(
        const Duration(seconds: 15), (Timer t) => update(id, token));
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
        //circleRadius = jsonDecode(gpsRes.body)["geofenceRadiusKm"] as double;
        carVelocity = jsonDecode(gpsRes.body)["velocity"].toDouble();
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
        //circleRadius = jsonDecode(gpsRes.body)["geofenceRadiusKm"] as double;
        carVelocity = jsonDecode(gpsRes.body)["velocity"].toDouble();
        error = false;
        loading = false;
      });
    }
  }

  Future<void> _showLimitsModal(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AppLimitsModal(
        geofenceValue: geofenceValue,
        velocityValue: velocityValue,
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
                            circleRadius: circleRadius,
                            carName:
                                "${list.cars[arguments["idCar"]].brandName} ${list.cars[arguments["idCar"]].modelYear}",
                          ),
                          const Positioned(
                            bottom: 24,
                            right: 24,
                            left: 24,
                            child:
                                AppSwitch(), // My cards showing in front of the Map's
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
                                    onPressed: () => _showLimitsModal(context)),
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
