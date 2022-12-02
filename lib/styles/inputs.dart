import 'package:flutter/material.dart';
import 'package:app/styles/colors.dart' as app_colors;

final primary = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: app_colors.primary,
      width: 1,
    ),
  ),
  focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: app_colors.primary, width: 1)),
  hintText: '',
);

final background = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: app_colors.background,
      width: 1,
    ),
  ),
  focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: app_colors.background, width: 1)),
  hintText: '',
);
