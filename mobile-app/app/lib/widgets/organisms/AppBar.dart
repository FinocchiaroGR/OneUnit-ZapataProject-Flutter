import 'package:flutter/material.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/consts/images.dart' as app_images;
import 'package:app/styles/colors.dart' as app_colors;

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Image.asset(app_images.logo),
      ),
      actions: <Widget>[
        AppTypography(
          text: title,
          type: "subtitle",
          align: TextAlign.right,
        )
      ],
      backgroundColor: app_colors.background,
      foregroundColor: app_colors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}