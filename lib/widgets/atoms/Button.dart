import 'package:flutter/material.dart';

import 'package:app/styles/buttons.dart' as app_buttons;

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String type;
  static final _stylesMap = {
    "primary": app_buttons.primary,
    "secondary": app_buttons.secondary,
    "background": app_buttons.background,
  };

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = "primary",
  });

  @override
  Widget build(BuildContext context) {
    final currentStyle = _stylesMap[type];

    return ElevatedButton(
      onPressed: onPressed,
      style: currentStyle,
      child: Text(text),
    );
  }
}
