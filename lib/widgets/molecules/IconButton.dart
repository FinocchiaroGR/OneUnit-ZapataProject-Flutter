import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const AppIconButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: onPressed,
      child: Ink(
        padding: const EdgeInsets.all(12),
        width: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: app_colors.primary,
          boxShadow: [
            BoxShadow(
              color: app_colors.shadow,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 48,
              color: app_colors.background,
            ),
            AppTypography(
              text: text,
              color: app_colors.background,
              align: TextAlign.center,
              type: "body2",
            )
          ],
        ),
      ),
    );
  }
}
