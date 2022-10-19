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
      title: "Info Auto",
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
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // Contenido en Pantalla
                  children: const <Widget>[
                    // Header
                    AppTypography(
                      align: TextAlign.center,
                      type: "h1",
                      text: "Iniciar Sesión",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),

                    //Correo
                    AppTypography(
                      align: TextAlign.left,
                      type: "body2",
                      text: "Correo:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo',
                      ),
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),

                    // Password
                    AppTypography(
                      align: TextAlign.left,
                      type: "body2",
                      text: "Contraseña:",
                      color: app_colors.primary,
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 8,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                      ),
                    ),
                    Divider(
                      color: Color(0xFFFFFF),
                      height: 32,
                    ),

                    // Boton - Iniciar sersion
                    //AppButton(text: "Iniciar sesióm", onPressed: ()=>{}),
                  ],
                )))),
      ),
    );
  }
}
