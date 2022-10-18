import 'package:flutter/material.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Slider.dart';
import 'package:app/styles/colors.dart' as app_colors;

class AppSliderInput extends StatelessWidget {
  final String label;
  final String minText;
  final double minValue;
  final String maxText;
  final double maxValue;
  final double initialValue;
  final int divisionValue;

  const AppSliderInput({
    super.key,
    required this.label,
    required this.minText,
    required this.minValue,
    required this.maxText,
    required this.maxValue,
    required this.initialValue,
    required this.divisionValue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            AppTypography(
              text: label,
              color: app_colors.primary,
              align: TextAlign.left,
              type: "body2",
            ),
            AppSlider(
              maxValue: maxValue,
              minValue: minValue,
              initialValue: initialValue,
              divisions: divisionValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTypography(
                  text: minText,
                  color: app_colors.primary,
                  align: TextAlign.left,
                  type: "body2",
                ),
                AppTypography(
                  text: maxText,
                  color: app_colors.primary,
                  align: TextAlign.right,
                  type: "body2",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
