import 'package:flutter/material.dart';
import 'package:app/styles/colors.dart' as app_colors;

class AppTextField extends StatefulWidget {
  const AppTextField({super.key});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: Color(0xFF404041),
          width: 1,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: app_colors.primary, width: 1)),
      hintText: '',
    ));
  }
}
