import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';

import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class UserInfo extends StatelessWidget {
  final String nombre;
  final String correo;
  final String dir;
  final String birth;
  final String lic;

  const UserInfo({
    super.key,
    required this.nombre,
    required this.correo,
    required this.dir,
    required this.birth,
    required this.lic,
  });

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
          AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: nombre,
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
          AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: correo,
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
          AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: dir,
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
          AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: birth,
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
          AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: lic,
            color: app_colors.primary,
          ),
          const SizedBox(height: 24),
          AppButton(text: "Editar", onPressed: () => {}),
        ],
      ),
    );
  }
}
