import 'package:flutter/material.dart';
import 'package:app/widgets/molecules/SliderInput.dart';
import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

class AppModalSlider extends StatelessWidget {
  final double valueInitG;
  final double valueInitV;
  const AppModalSlider(
      {super.key, required this.valueInitG, required this.valueInitV});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Modal',
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: app_colors.background,
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const AppTypography(
                  text: "Límites",
                  color: app_colors.primary,
                  align: TextAlign.center,
                  type: "h1",
                ),
                AppSliderInput(
                  label: "Editar rango de geocerca",
                  minText: "20 km",
                  minValue: 20,
                  maxText: "50 km",
                  maxValue: 50,
                  initialValue: valueInitG,
                  divisionValue: 50,
                ),
                AppSliderInput(
                  label: "Editar velocidad máxima",
                  minText: "10 km",
                  minValue: 10,
                  maxText: "150 km",
                  maxValue: 150,
                  initialValue: valueInitV,
                  divisionValue: 150,
                ),
                AppButton(
                    text: "Aceptar", onPressed: () => Navigator.pop(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
