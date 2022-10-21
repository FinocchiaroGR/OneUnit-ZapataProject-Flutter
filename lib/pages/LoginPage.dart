import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/organisms/LoginForm.dart';

import 'package:app/styles/colors.dart' as app_colors;

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      hasBottomNavigation: false,
      title: "Hola",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          AppTypography(
            align: TextAlign.center,
            type: "h1",
            text: "Iniciar sesión",
            color: app_colors.primary,
          ),
          AppLoginForm(),
          AppTypography(
            align: TextAlign.center,
            type: "body2",
            text: "¿Todavía no tienes cuenta?",
            color: app_colors.primary,
          ),
        ],
      ),
    );
  }
}
