import 'package:flutter/material.dart';
import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/styles/textStyles.dart' as app_styles;

final ButtonStyle roundStyle = ElevatedButton.styleFrom(
  backgroundColor: app_colors.primary,
  foregroundColor: app_colors.background,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  textStyle: app_styles.body2,
);

class AppRoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const AppRoundButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: ElevatedButton(
        onPressed: onPressed,
        style: roundStyle,
        child: Text(text),
      ),
    );
  }
}
