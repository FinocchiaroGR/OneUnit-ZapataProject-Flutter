import 'package:flutter/material.dart';
import 'package:app/styles/textStyles.dart' as app_styles;
import 'package:app/styles/colors.dart' as app_colors;

class AppRoundInfo extends StatelessWidget {
  final String text;

  const AppRoundInfo({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: app_colors.secondary,
      ),
      width: 72,
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: app_styles.body2,
          ),
        ],
      ),
    );
  }
}
