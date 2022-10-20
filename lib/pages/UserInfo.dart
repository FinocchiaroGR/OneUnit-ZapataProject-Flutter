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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                  text: nombre,
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
                  text: correo,
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
                  text: dir,
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
                  text: birth,
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
                  text: lic,
                  color: app_colors.primary,
                ),
                const SizedBox(height: 15),
                AppButton(
                    text: "Editar", type: "secondary", onPressed: () => {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
