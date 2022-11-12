import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/organisms/LoginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      hasBottomNavigation: false,
      hasColorBackground: true,
      title: "Hola",
      body: Column(
        children: const <Widget>[
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppTypography(
                type: "hx",
                text: "Iniciar sesión",
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: AppLoginForm(),
            ),
          ),

          /* -- Sin Cuenta Banner --
          Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: AppTypography(
                      align: TextAlign.center,
                      type: "body2",
                      text: "¿Todavía no tienes cuenta?",
                      color: app_colors.primary,
                    ),
                  ),
                ),
              ),
          */
        ],
      ),
    );
  }
}
