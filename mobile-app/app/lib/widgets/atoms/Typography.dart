import 'package:flutter/material.dart';
import "../../styles/colors.dart" as app_colors;
import "../../styles/textStyles.dart" as app_styles;

class AppTypography extends StatelessWidget {
  final String text;
  final String type;
  final Color color;
  final TextAlign align;
  static const _stylesMap = {
    "h1": app_styles.h1,
    "h2": app_styles.h2,
    "h3": app_styles.h3,
    "subtitle": app_styles.subtitle,
    "body1": app_styles.body1,
    "body2": app_styles.body2,
  };

  const AppTypography({
    Key? key,
    required this.text,
    this.type = "body1",
    this.color = app_colors.primary,
    this.align = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentStyle = _stylesMap[type];
    currentStyle!.apply(color: color);

    return Text(
      text,
      style: currentStyle,
      textAlign: align,
    );
  }
}
