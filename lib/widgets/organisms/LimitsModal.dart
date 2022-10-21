import 'package:flutter/material.dart';

import 'package:app/widgets/molecules/SliderInput.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

import 'package:app/styles/colors.dart' as app_colors;

class AppLimitsModal extends StatelessWidget {
  final double geofenceValue;
  final double velocityValue;

  const AppLimitsModal({
    super.key,
    required this.geofenceValue,
    required this.velocityValue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: app_colors.background,
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppTypography(
            text: "Modificar límites",
            color: app_colors.primary,
            align: TextAlign.center,
            type: "h2",
          ),
          const SizedBox(
            height: 24,
          ),
          AppSliderInput(
            label: "Editar rango de geocerca",
            minText: "20 km",
            minValue: 20,
            maxText: "50 km",
            maxValue: 50,
            initialValue: geofenceValue,
          ),
          const SizedBox(
            height: 24,
          ),
          AppSliderInput(
            label: "Editar velocidad máxima",
            minText: "10 km",
            minValue: 10,
            maxText: "150 km",
            maxValue: 150,
            initialValue: velocityValue,
          ),
          const SizedBox(
            height: 28,
          ),
          AppButton(text: "Aceptar", onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
