import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/styles/textStyles.dart' as app_styles;

class AppTypography extends StatelessWidget {
  final String text;
  final String type;
  final Color color;
  final TextAlign align;
  static const _stylesMap = {
    "hx": app_styles.hx,
    "h1": app_styles.h1,
    "h2": app_styles.h2,
    "h3": app_styles.h3,
    "subtitle": app_styles.subtitle,
    "body1": app_styles.body1,
    "body2": app_styles.body2,
  };

  const AppTypography({
    super.key,
    required this.text,
    this.type = "body1",
    this.color = app_colors.primary,
    this.align = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    final currentStyle = _stylesMap[type]!.apply(color: color);

    return Text(
      text,
      style: currentStyle,
      textAlign: align,
    );
  }
}
