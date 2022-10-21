import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class UserInfo extends StatelessWidget {
  final String name = 'Juan Pablo Aldasoro';
  final String email = 'juan.pablo@hotmail.com';
  final String address = 'Blvd. Quintana 588, San Pedrito';
  final String birthDate = '24/08/1995';
  final String licenceValidity = '22/12/2025';

  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Información",
      navigationCurrentIndex: 0,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const AppTypography(
              align: TextAlign.left,
              type: "h3",
              text: "Nombre:",
              color: app_colors.primary,
            ),
            const SizedBox(height: 5),
            AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: name,
              color: app_colors.primary,
            ),
            const SizedBox(height: 20),
            const AppTypography(
              align: TextAlign.left,
              type: "h3",
              text: "Correo:",
              color: app_colors.primary,
            ),
            const SizedBox(height: 5),
            AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: email,
              color: app_colors.primary,
            ),
            const SizedBox(height: 20),
            const AppTypography(
              align: TextAlign.left,
              type: "h3",
              text: "Dirección:",
              color: app_colors.primary,
            ),
            const SizedBox(height: 5),
            AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: address,
              color: app_colors.primary,
            ),
            const SizedBox(height: 20),
            const AppTypography(
              align: TextAlign.left,
              type: "h3",
              text: "Fecha de nacimiento:",
              color: app_colors.primary,
            ),
            const SizedBox(height: 5),
            AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: birthDate,
              color: app_colors.primary,
            ),
            const SizedBox(height: 20),
            const AppTypography(
              align: TextAlign.left,
              type: "h3",
              text: "Expiración LDC:",
              color: app_colors.primary,
            ),
            const SizedBox(height: 5),
            AppTypography(
              align: TextAlign.left,
              type: "body1",
              text: licenceValidity,
              color: app_colors.primary,
            ),
            const SizedBox(height: 15),
            AppButton(text: "Editar", type: "secondary", onPressed: () => {}),
          ],
        ),
      ),
    );
  }
}
