import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

import 'package:app/styles/colors.dart' as app_colors;

class AppValidity extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: app_colors.primary,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 10,
            color: app_colors.shadow,
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 20, right: 32, bottom: 32, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AppTypography(
            align: TextAlign.left,
            type: "h1",
            text: "Vigencias",
            color: app_colors.background,
          ),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                const AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: "Póliza de\nseguro",
                  color: app_colors.background,
                ),
                AppTypography(
                  align: TextAlign.left,
                  type: "body2",
                  text: insurancePolicy,
                  color: app_colors.background,
                ),
              ],
            ),
            Column(
              children: [
                const AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: "Tarjeta de\ncirculación",
                  color: app_colors.background,
                ),
                AppTypography(
                  align: TextAlign.left,
                  type: "body2",
                  text: circulationCard,
                  color: app_colors.background,
                ),
              ],
            ),
          ]),
          const SizedBox(
            height: 24,
          ),
          Column(children: [
            const AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: "Verificación\nvehicular",
              color: app_colors.background,
            ),
            AppTypography(
              align: TextAlign.left,
              type: "body2",
              text: vehicleVerification,
              color: app_colors.background,
            ),
          ]),
          const SizedBox(
            height: 32,
          ),
          Column(
            children: <Widget>[
              AppButton(
                text: "Editar",
                onPressed: () => {},
                type: 'secondary',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
