import 'package:flutter/material.dart';

import '/widgets/atoms/Typography.dart';
import '/widgets/organisms/Page.dart';
import 'package:app/styles/colors.dart' as app_colors;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<StatefulWidget> {
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
              // Boton - Iniciar sersion
              //AppButton(text: "Iniciar sesióm", onPressed: ()=>{}),
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
          labelText: 'Correo',
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
          labelText: 'Contraseña',
        ),
      ),
      SizedBox(
        height: 32,
      ),
    ],
  );
}
