import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/LocationMap.dart';
import 'package:app/widgets/atoms/RoundInfo.dart';
import 'package:app/widgets/atoms/RoundButton.dart';
import 'package:app/widgets/molecules/LargeIconButton.dart';

import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/consts/urls.dart' as app_urls;

class CarLocation extends StatelessWidget {
  const CarLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "BMW M4 2022",
      hasPadding: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 178,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Stack(
                children: <Widget>[
                  const AppLocationMap(
                    latitude: 20.61248512229703,
                    longitude: -100.40373924688542,
                    circleRadius: 150,
                  ),
                  Positioned(
                    top: 24,
                    right: 24,
                    child: Column(
                      children: [
                        const AppRoundInfo(text: "90\nkm/hr"),
                        const SizedBox(height: 8),
                        AppRoundButton(
                          text: "Edit",
                          onPressed: () => {},
                        ),
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
                onPressed: () => Navigator.pushNamed(context, app_urls.carInfo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
