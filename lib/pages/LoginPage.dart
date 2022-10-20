import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart' as app_colors;
import '/widgets/atoms/Typography.dart';
import 'package:app/widgets/molecules/inputLogin.dart';
import '../widgets/organisms/Page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPage(
      hasAppBar: true,
      hasBottomNavigation: false,
      hasPadding: false,
      title: "Hola",
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: <Widget>[
              const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: AppTypography(
                      align: TextAlign.center,
                      type: "h1",
                      text: "Iniciar sesión",
                      color: app_colors.primary,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: AppInputLoginForm(),
                  ),
                ],
              ),
              const Flexible(
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
            ],
          ),
        ),
      ),
    );
  }
}
