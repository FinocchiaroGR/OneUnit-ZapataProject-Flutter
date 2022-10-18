// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/AppBar.dart';
import 'package:app/widgets/organisms/BottomNavigation.dart';

import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/images.dart' as app_images;

const dummyCarSlides = [
  {
    'src': app_images.logo,
    'name': 'OneUnit',
  },
  {
    'src': app_images.carPlaceholder,
    'name': 'Zapata',
  },
  {
    'src': app_images.carPlaceholder,
    'name': 'Connect',
  },
  {
    'src': app_images.carPlaceholder,
    'name': 'For clients',
  },
];

class FormUser extends StatelessWidget {
  const FormUser({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Información"),
      bottomNavigationBar: const AppBottomNavigation(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                margin: EdgeInsets.all(24),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    AppTypography(
                      align: TextAlign.left,
                      type: "h3",
                      text: "Nombre:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "subtitle",
                      text: "Juan Pablo Aldasoro",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "h3",
                      text: "Correo:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "subtitle",
                      text: "juan.pablo@hotmail.com",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "h3",
                      text: "Dirección:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "subtitle",
                      text:
                          "Blvd. Quitana 588, San Peditro Peñuelas I, 76148, Santiago de Querétaro, Qro.",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "h3",
                      text: "Fecha de nacimiento:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "subtitle",
                      text: "24/08/1995",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "h3",
                      text: "Expiración LDC:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    AppTypography(
                      align: TextAlign.left,
                      type: "subtitle",
                      text: "24/08/1995",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 24,
                    ),
                    // AppButton(text: "Editar", onPressed: () => {}),
                  ],
                )))),
      ),
    );
  }
}
