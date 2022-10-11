import 'package:flutter/material.dart';
import "./colors.dart" as app_colors;
import "./textStyles.dart" as app_styles;

final ButtonStyle primary = ElevatedButton.styleFrom(
  backgroundColor: app_colors.primary,
  foregroundColor: app_colors.background,
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
  textStyle: app_styles.body1,
);

final ButtonStyle secondary = ElevatedButton.styleFrom(
  backgroundColor: app_colors.secondary,
  foregroundColor: app_colors.primary,
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
  textStyle: app_styles.body1,
);

final ButtonStyle background = ElevatedButton.styleFrom(
  backgroundColor: app_colors.background,
  foregroundColor: app_colors.primary,
  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
  textStyle: app_styles.body1,
);
