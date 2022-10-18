import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';

import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Información",
      navigationCurrentIndex: 0,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "Nombre:",
            color: app_colors.primary,
          ),
          const SizedBox(height: 8),
          const AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: "Juan Pablo Aldasoro",
            color: app_colors.primary,
          ),
          const SizedBox(height: 32),
          const AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "Correo:",
            color: app_colors.primary,
          ),
          const SizedBox(height: 8),
          const AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: "juan.pablo@hotmail.com",
            color: app_colors.primary,
          ),
          const SizedBox(height: 32),
          const AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "Dirección:",
            color: app_colors.primary,
          ),
          const SizedBox(height: 8),
          const AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text:
                "Blvd. Quitana 588, San Peditro Peñuelas I, 76148, Santiago de Querétaro, Qro.",
            color: app_colors.primary,
          ),
          const SizedBox(height: 32),
          const AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "Fecha de nacimiento:",
            color: app_colors.primary,
          ),
          const SizedBox(height: 8),
          const AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: "24/08/1995",
            color: app_colors.primary,
          ),
          const SizedBox(height: 32),
          const AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "Expiración LDC:",
            color: app_colors.primary,
          ),
          const SizedBox(height: 8),
          const AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: "24/08/1995",
            color: app_colors.primary,
          ),
          const SizedBox(height: 24),
          AppButton(text: "Editar", onPressed: () => {}),
        ],
      ),
    );
  }
}
