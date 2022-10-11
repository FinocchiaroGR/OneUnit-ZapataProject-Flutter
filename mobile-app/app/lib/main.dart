import 'package:flutter/material.dart';
import "./widgets/atoms/Typography.dart";
import "./styles/colors.dart" as app_colors;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    color: Colors.white,
    home: Scaffold(
      body: SafeArea(
          child: Wrap(
        children: const <AppTypography>[
          AppTypography(
            align: TextAlign.left,
            type: "h1",
            text: "This is an h1",
            color: app_colors.primary,
          ),
          AppTypography(
            align: TextAlign.left,
            type: "h2",
            text: "This is an h2",
            color: app_colors.primary,
          ),
          AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "This is an h3",
            color: app_colors.primary,
          ),
          AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: "This is a subtitle",
            color: app_colors.primary,
          ),
          AppTypography(
            align: TextAlign.left,
            type: "body1",
            text: "This is a body1",
            color: app_colors.primary,
          ),
          AppTypography(
            align: TextAlign.left,
            type: "body2",
            text: "This is a body2",
            color: app_colors.primary,
          ),
        ],
      )),
    ),
  ));
}
