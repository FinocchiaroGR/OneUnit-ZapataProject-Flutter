import 'package:flutter/material.dart';

import 'package:app/styles/inputs.dart' as app_inputs;

class AppTextField extends StatefulWidget {
  final String type;

  const AppTextField({
    super.key,
    this.type = "normal",
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  static final _stylesMap = {
    "normal": app_inputs.primary,
    "background": app_inputs.background,
  };

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _stylesMap[widget.type],
    );
  }
}
