import 'dart:math';

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
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 80,
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Image.asset(app_images.logo, width: 150),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 24, top: 22),
          child: AppTypography(
            text: title.substring(0, min(12, title.length)),
            type: "subtitle",
            align: TextAlign.right,
          ),
        ),
      ],
      backgroundColor: app_colors.background,
      foregroundColor: app_colors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
