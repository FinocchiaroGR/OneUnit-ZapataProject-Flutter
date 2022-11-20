import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/styles/icons.dart' as app_icons;

class AppValidity extends StatefulWidget {
  final String insurancePolicy;
  final String circulationCard;
  final String vehicleVerification;

  const AppValidity({
    super.key,
    required this.insurancePolicy,
    required this.circulationCard,
    required this.vehicleVerification,
  });

  @override
  State<AppValidity> createState() => _AppValidityState();
}

class _AppValidityState extends State<AppValidity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTypography(
                    align: TextAlign.left,
                    type: "h3",
                    text: "Póliza de seguros",
                    color: app_colors.primary,
                  ),
                  AppTypography(
                    align: TextAlign.left,
                    type: "body1",
                    text: widget.vehicleVerification,
                    color: app_colors.primary,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(app_icons.pencil),
              color: app_colors.primary,
              onPressed: () {
                {
                  showDatePicker(
                    context: context,
                    locale: const Locale("es", "MX"),
                    helpText:
                        "Selecciona la fecha de expiración de tu póliza de seguros:",
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2040),
                    builder: (BuildContext context, Widget? child) {
                      return child!;
                    },
                  );
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTypography(
                    align: TextAlign.left,
                    type: "h3",
                    text: "Tarjeta de circulación",
                    color: app_colors.primary,
                  ),
                  AppTypography(
                    align: TextAlign.left,
                    type: "body1",
                    text: widget.vehicleVerification,
                    color: app_colors.primary,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(app_icons.pencil),
              color: app_colors.primary,
              onPressed: () {
                {
                  showDatePicker(
                    context: context,
                    locale: const Locale("es", "MX"),
                    helpText:
                        "Selecciona la fecha de expiración de tu tarjeta de circulación:",
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2040),
                    builder: (BuildContext context, Widget? child) {
                      return child!;
                    },
                  );
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTypography(
                    align: TextAlign.left,
                    type: "h3",
                    text: "Verificación vehicular",
                    color: app_colors.primary,
                  ),
                  AppTypography(
                    align: TextAlign.left,
                    type: "body1",
                    text: widget.vehicleVerification,
                    color: app_colors.primary,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(app_icons.pencil),
              color: app_colors.primary,
              onPressed: () {
                {
                  showDatePicker(
                    context: context,
                    locale: const Locale("es", "MX"),
                    helpText:
                        "Selecciona la fecha de expiración de la verificación de tu carro:",
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2018),
                    lastDate: DateTime(2040),
                    builder: (BuildContext context, Widget? child) {
                      return child!;
                    },
                  );
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
