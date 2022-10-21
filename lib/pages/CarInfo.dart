import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class CarInfo extends StatelessWidget {
  final String carImage = 'assets/images/car-placeholder.jpg';
  final String carBrand = "BMW";
  final String carModel = "M4";
  final String carYear = "2021";
  final String carDescription =
      "Consequat aute cupidatat aliquip do quis. Nisi aute sit culpa culpa ut. Culpa laboris exercitation sit cupidatat sit veniam deserunt culpa ut Lorem esse minim. In minim eu ea velit mollit nulla et Lorem eu officia culpa eiusmod excepteur voluptate. Ea pariatur ut excepteur consequat minim sint.";

  const CarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Info Auto",
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(carImage),
            AppTypography(
              align: TextAlign.center,
              type: "h2",
              text: [carBrand, carModel, carYear].join(" "),
              color: app_colors.primary,
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTypography(
                  align: TextAlign.left,
                  type: "h3",
                  text: "Descripción",
                  color: app_colors.primary,
                ),
                AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: carDescription,
                  color: app_colors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
