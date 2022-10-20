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
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: AppTypography(
              text: label,
              color: app_colors.primary,
              type: "body1",
              align: TextAlign.left,
            ),
          ),
          Expanded(
            child: AppSlider(
              maxValue: maxValue,
              minValue: minValue,
              initialValue: initialValue,
              divisions: divisionValue,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AppTypography(
                    text: minText,
                    color: app_colors.primary,
                    type: "body2",
                    align: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: AppTypography(
                    text: maxText,
                    color: app_colors.primary,
                    type: "body2",
                    align: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
