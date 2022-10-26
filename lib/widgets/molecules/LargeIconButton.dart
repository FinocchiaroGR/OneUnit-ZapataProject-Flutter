import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class AppLargeIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const AppLargeIconButton({
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
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: app_colors.secondary,
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
              size: 20,
              color: app_colors.primary,
            ),
            AppTypography(
              text: text,
              color: app_colors.primary,
              align: TextAlign.center,
              type: "body2",
            )
          ],
        ),
      ),
    );
  }
}
