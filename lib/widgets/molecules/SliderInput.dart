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

  const AppSliderInput({
    super.key,
    required this.label,
    required this.minText,
    required this.minValue,
    required this.maxText,
    required this.maxValue,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppTypography(
          text: label,
          color: app_colors.primary,
          type: "body1",
          align: TextAlign.left,
        ),
        AppSlider(
          maxValue: maxValue,
          minValue: minValue,
          initialValue: initialValue,
          divisions: maxValue.toInt(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppTypography(
              text: minText,
              color: app_colors.primary,
              type: "body2",
              align: TextAlign.left,
            ),
            AppTypography(
              text: maxText,
              color: app_colors.primary,
              type: "body2",
              align: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }
}
