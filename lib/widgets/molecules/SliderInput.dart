import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Slider.dart';

import 'package:app/styles/colors.dart' as app_colors;

typedef void SliderCallback(double val);
class AppSliderInput extends StatefulWidget {
  final String label;
  final String minText;
  final double minValue;
  final String maxText;
  final double maxValue;
  final double initialValue;
  final SliderCallback onValueChanged; 

  const AppSliderInput({
    super.key,
    required this.label,
    required this.minText,
    required this.minValue,
    required this.maxText,
    required this.maxValue,
    required this.initialValue,
    required this.onValueChanged
  });

  @override
  State<AppSliderInput> createState() => _AppSliderInputState();
}

class _AppSliderInputState extends State<AppSliderInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppTypography(
          text: widget.label,
          color: app_colors.primary,
          type: "body1",
          align: TextAlign.left,
        ),
        AppSlider(
          maxValue: widget.maxValue,
          minValue: widget.minValue,
          initialValue: widget.initialValue,
          divisions: widget.maxValue.toInt(),
          onValueChanged: widget.onValueChanged
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppTypography(
              text: widget.minText,
              color: app_colors.primary,
              type: "body2",
              align: TextAlign.left,
            ),
            AppTypography(
              text: widget.maxText,
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
