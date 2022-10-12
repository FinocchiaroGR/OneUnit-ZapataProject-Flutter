import 'package:app/providers/PageProvider.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/molecules/IconButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "./widgets/atoms/Typography.dart";
import 'package:app/widgets/organisms/AppBar.dart';
import './widgets/organisms/BottomNavigation.dart';
import "./styles/colors.dart" as app_colors;
import "./styles/icons.dart" as app_icons;

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PageProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        appBar: const AppAppBar(title: "LamborghiniP"),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            const AppTypography(
              align: TextAlign.left,
              type: "h1",
              text: "This is an h1",
              color: app_colors.primary,
            ),
            const AppTypography(
              align: TextAlign.left,
              type: "h2",
              text: "This is an h2",
              color: app_colors.primary,
            ),
            const AppTypography(
              align: TextAlign.left,
              type: "h3",
              text: "This is an h3",
              color: app_colors.primary,
            ),
            const AppTypography(
              align: TextAlign.left,
              type: "subtitle",
              text: "This is a subtitle",
              color: app_colors.primary,
            ),
            const AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: "This is a body1",
              color: app_colors.primary,
            ),
            const AppTypography(
              align: TextAlign.left,
              type: "body2",
              text: "This is a body2",
              color: app_colors.primary,
            ),
            AppButton(text: "Click here", onPressed: () => {}),
            AppIconButton(
                text: "Some text", icon: app_icons.sellCar, onPressed: () => {})
          ],
        )),
        bottomNavigationBar: const AppBottomNavigation(),
      ),
    ),
  ));
}
