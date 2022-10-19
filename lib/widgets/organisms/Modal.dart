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
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          insetPadding: const EdgeInsets.symmetric(vertical: 200),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 34, horizontal: 34),
          content: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const AppTypography(
                text: "Límites",
                color: app_colors.primary,
                align: TextAlign.center,
                type: "h1",
              ),
              const SizedBox(
                height: 10,
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
              const SizedBox(
                height: 5,
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
              const SizedBox(
                height: 5,
              ),
              AppButton(
                  text: "Aceptar", onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }
}
