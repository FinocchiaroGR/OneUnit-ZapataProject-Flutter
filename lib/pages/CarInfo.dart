import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:provider/provider.dart';

class CarInfo extends StatelessWidget {
  final String carImage = 'assets/images/car-placeholder.jpg';

  const CarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, list, child) {
        return AppPage(
          title: "Info Auto",
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(carImage),
                AppTypography(
                  align: TextAlign.center,
                  type: "h2",
                  text: [
                    list.cars[0].brandName,
                    list.cars[0].modelName,
                    list.cars[0].modelYear
                  ].join(" "),
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
                      text: list.cars[0].description.toString(),
                      color: app_colors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
