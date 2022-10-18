// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/AppBar.dart';
import 'package:app/widgets/organisms/BottomNavigation.dart';

import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/images.dart' as app_images;

class FormAuto extends StatelessWidget {
  const FormAuto({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigation(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _car(context),
                    const AppTypography(
                      align: TextAlign.center,
                      type: "h2",
                      text: "BMW M4 2021",
                      color: app_colors.primary,
                    ),
                    // const Divider(
                    //   color: Color(0xFFFFFF),
                    //   height: 8,
                    // ),
                    _carDesc(context),
                  ],
                ))),
      ),
    );
  }
}

_car(context) {
  return Column(
    children: [
      Image.asset(
        'assets/images/car-placeholder.jpg',
      ),
    ],
  );
}

_carDesc(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      AppTypography(
        align: TextAlign.left,
        type: "h3",
        text: "Descripcion",
        color: app_colors.primary,
      ),
      AppTypography(
        align: TextAlign.left,
        type: "body2",
        text:
            "Consequat aute cupidatat aliquip do quis. Nisi aute sit culpa culpa ut. Culpa laboris exercitation sit cupidatat sit veniam deserunt culpa ut Lorem esse minim. In minim eu ea velit mollit nulla et Lorem eu officia culpa eiusmod excepteur voluptate. Ea pariatur ut excepteur consequat minim sint.",
        color: app_colors.primary,
      ),
    ],
  );
}
