import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/LocationMap.dart';

import 'package:app/styles/colors.dart' as app_colors;

class CarLocation extends StatelessWidget {
  const CarLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "BMW M4 2022",
      hasPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height - 178,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Stack(
                children: [
                  AppLocationMap(latitude: 204, longitude: -101),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Ink(
                color: app_colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
