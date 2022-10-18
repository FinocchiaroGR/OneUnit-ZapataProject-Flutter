import 'package:flutter/material.dart';
import 'package:app/widgets/molecules/SliderInput.dart';
import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

class AppModalSlider extends StatelessWidget {
  const AppModalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const AppTypography(
            text: "Editar límites",
            color: app_colors.primary,
            align: TextAlign.center,
            type: "h1",
          ),
          actions: <Widget>[
            Container(
              color: app_colors.background,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const AppSliderInput(
                    label: "Editar rango de geocerca",
                    minText: "20 km",
                    minValue: 20,
                    maxText: "50 km",
                    maxValue: 50,
                    initialValue: 35,
                    divisionValue: 6,
                  ),
                  const AppSliderInput(
                    label: "Editar velocidad máxima",
                    minText: "10 km",
                    minValue: 10,
                    maxText: "150 km",
                    maxValue: 150,
                    initialValue: 80,
                    divisionValue: 14,
                  ),
                  AppButton(
                      text: "Aceptar", onPressed: () => Navigator.pop(context)),
                ],
              ),
            )
          ],
        ),
      ),
      child: Ink(
        color: app_colors.primary,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: const AppTypography(
          text: "Modal",
          color: app_colors.secondary,
          align: TextAlign.center,
          type: "body1",
        ),
      ),
    );
  }
}
