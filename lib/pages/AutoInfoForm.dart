import 'package:flutter/material.dart';
import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/molecules/Vigencias.dart';
import 'package:app/styles/colors.dart' as app_colors;

class FormAuto extends StatelessWidget {
  const FormAuto({super.key});
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Info Auto",
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                _car(),
                const AppTypography(
                  align: TextAlign.center,
                  type: "h2",
                  text: "BMW M4 2021",
                  color: app_colors.primary,
                ),
                const SizedBox(
                  height: 30,
                ),
                _carDesc(),
                const SizedBox(
                  height: 30,
                ),
                const Vigencias(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_car() {
  return Column(
    children: [
      Image.asset(
        'assets/images/car-placeholder.jpg',
      ),
    ],
  );
}

_carDesc() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      AppTypography(
        align: TextAlign.left,
        type: "h3",
        text: "Descripción",
        color: app_colors.primary,
      ),
      AppTypography(
        align: TextAlign.left,
        type: "body1",
        text:
            "Consequat aute cupidatat aliquip do quis. Nisi aute sit culpa culpa ut. Culpa laboris exercitation sit cupidatat sit veniam deserunt culpa ut Lorem esse minim. In minim eu ea velit mollit nulla et Lorem eu officia culpa eiusmod excepteur voluptate. Ea pariatur ut excepteur consequat minim sint.",
        color: app_colors.primary,
      ),
    ],
  );
}
