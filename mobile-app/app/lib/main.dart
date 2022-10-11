import 'package:flutter/material.dart';
import "./widgets/atoms/Typography.dart";
import "./styles/colors.dart" as app_colors;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    color: Colors.white,
    home: Scaffold(
      body: SafeArea(
        child: AppTypography(
          align: TextAlign.left,
          type: "h2",
          text: "hello world",
          color: app_colors.secondary,
        ),
      ),
    ),
  ));
}
