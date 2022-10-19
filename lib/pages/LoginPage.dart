import 'package:flutter/material.dart';

import '/widgets/atoms/Typography.dart';
import 'package:app/widgets/organisms/AppBar.dart';
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
      title: "Bienvenido",
      body: SingleChildScrollView(
        // SafeArea
        child: SafeArea(
            // Container 2
            child: Container(
          // EdgeInserts - An immutable set of offsets in each of the four cardinal directions.
          margin: const EdgeInsets.all(24),
          // Columna
          child: (Column(
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
              _forgetPassword(),
              _noTienesCuenta(),
            ],
          )),
        )),
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

_forgetPassword() {
  return Column(
    children: const [
      AppTypography(
        align: TextAlign.left,
        type: "body2",
        text: "¿Olvidaste tu contraseña?",
        color: app_colors.primary,
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
        text: "¿No tienes cuentas?",
        color: app_colors.primary,
      ),
    ],
  );
}
