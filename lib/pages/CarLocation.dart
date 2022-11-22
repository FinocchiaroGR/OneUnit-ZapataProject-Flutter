import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/LocationMap.dart';
import 'package:app/widgets/atoms/RoundInfo.dart';
import 'package:app/widgets/atoms/RoundButton.dart';
import 'package:app/widgets/molecules/LargeIconButton.dart';
import 'package:app/widgets/organisms/LimitsModal.dart';

import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:provider/provider.dart';

class CarLocation extends StatelessWidget {
  final double latitude = 20.61248512229703;
  final double longitude = -100.40373924688542;
  final double circleRadius = 150;
  final double carVelocity = 90;
  final double geofenceValue = 0;
  final double velocityValue = 0;

  const CarLocation({super.key});

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
    return Consumer<UserProvider>(
      builder: (context, list, child) {
        return AppPage(
          title: list.cars[arguments["idCar"]].brandName.toString() +
              list.cars[arguments["idCar"]].modelYear.toString(),
          hasPadding: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).padding.bottom +
                    kToolbarHeight +
                    kBottomNavigationBarHeight +
                    MediaQuery.of(context).viewPadding.top +
                    MediaQuery.of(context).viewPadding.bottom),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Stack(
                    children: <Widget>[
                      AppLocationMap(
                        latitude: latitude,
                        longitude: longitude,
                        circleRadius: circleRadius,
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
                    onPressed: () => Navigator.pushNamed(
                      context,
                      app_urls.carInfo,
                      arguments: arguments["idCar"],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
