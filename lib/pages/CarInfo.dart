import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:provider/provider.dart';

class CarInfo extends StatelessWidget {
  final String carImage = 'http://54.176.51.35:1337/images/';

  const CarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)?.settings.arguments as int);
    return Consumer<UserProvider>(
      builder: (context, list, child) {
        return AppPage(
          title: "Info Auto",
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(carImage + list.cars[id].image.toString()),
                AppTypography(
                  align: TextAlign.center,
                  type: "h2",
                  text: [
                    list.cars[id].brandName,
                    list.cars[id].modelName,
                    list.cars[id].modelYear
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
                      text: list.cars[id].description.toString(),
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
