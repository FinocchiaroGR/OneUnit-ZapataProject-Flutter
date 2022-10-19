import 'package:flutter/material.dart';

import '../widgets/organisms/Page.dart';
import '/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/styles/colors.dart' as app_colors;

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      hasAppBar: true,
      hasBottomNavigation: false,
      title: "Hola",
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          // Columna
          child: Column(
            // Alineacióm
            crossAxisAlignment: CrossAxisAlignment.center,
            // Contenido en Pantalla
            children: [
              // Header
              const AppTypography(
                align: TextAlign.center,
                type: "h1",
                text: "Iniciar Sesión",
                color: app_colors.primary,
              ),
              const SizedBox(
                height: 33,
              ),
              _inputForm(),
              const SizedBox(
                height: 15,
              ),
              AppButton(text: "Iniciar Sesión", onPressed: () => {}),
              const SizedBox(
                height: 200,
              ),
              _noTienesCuenta(),
            ],
          ),
        ),
      ),
    );
  }
}

_inputForm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      AppTypography(
        align: TextAlign.left,
        type: "body2",
        text: "Correo",
        color: app_colors.primary,
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(
        height: 32,
      ),

      // Password
      AppTypography(
        align: TextAlign.left,
        type: "body2",
        text: "Contraseña:",
        color: app_colors.primary,
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(
        height: 32,
      ),
    ],
  );
}

_noTienesCuenta() {
  return Column(
    children: const [
      AppTypography(
        align: TextAlign.center,
        type: "body2",
        text: "¿No tienes cuenta?",
        color: app_colors.primary,
      ),
    ],
  );
}
