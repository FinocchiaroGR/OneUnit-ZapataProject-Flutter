import 'package:flutter/material.dart';
import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

class Vigencias extends StatelessWidget {
  const Vigencias({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: app_colors.primary,
        boxShadow: const [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 10,
            color: app_colors.shadow,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 20, right: 40),
      // color: app_colors.primary,
      // width: 450,
      // height: 350,

      child: Ink(
        color: app_colors.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AppTypography(
              align: TextAlign.left,
              type: "h1",
              text: "Vigencias",
              color: app_colors.background,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppTypography(
                    align: TextAlign.left,
                    type: "body1",
                    text: "Póliza de\nseguro",
                    color: app_colors.background,
                  ),
                  AppTypography(
                    align: TextAlign.left,
                    type: "body1",
                    text: "Tarjeta de\ncirculación",
                    color: app_colors.background,
                  ),
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppTypography(
                    align: TextAlign.left,
                    type: "body2",
                    text: "24/08/1995",
                    color: app_colors.background,
                  ),
                  AppTypography(
                    align: TextAlign.left,
                    type: "body2",
                    text: "240/08/1995",
                    color: app_colors.background,
                  ),
                ]),
            const SizedBox(
              height: 30,
            ),
            Column(children: const [
              AppTypography(
                align: TextAlign.left,
                type: "body1",
                text: "Verificación\nvehicular",
                color: app_colors.background,
              ),
              AppTypography(
                align: TextAlign.left,
                type: "body2",
                text: "240/08/1995",
                color: app_colors.background,
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Column(children: <Widget>[
              AppButton(
                text: "Editar",
                onPressed: () => {},
                type: 'secondary',
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
