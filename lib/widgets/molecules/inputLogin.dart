import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

class AppInputLoginForm extends StatelessWidget {
  const AppInputLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTypography(
          align: TextAlign.left,
          type: "body2",
          text: "Correo",
          color: app_colors.primary,
        ),
        const SizedBox(
          height: 8,
        ),
        const TextField(
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 32,
        ),

        // Password
        const AppTypography(
          align: TextAlign.left,
          type: "body2",
          text: "Contraseña:",
          color: app_colors.primary,
        ),
        const SizedBox(
          height: 8,
        ),
        const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
          onTap: () {
            login(
              emailController.text.toString(),
              passwordController.text.toString(),
            );
          },
          child: Container(
            height: 50,
            decoration: const BoxDecoration(color: app_colors.primary),
            child: Center(
              child: AppButton(
                text: "Iniciar Sesión",
                onPressed: () => Navigator.pushNamed(context, app_urls.home),
              ),
            ),
            //text: "Iniciar Sesión",
            //onPressed: () => Navigator.pushNamed(context, app_urls.home),
          ),
        ),
        const SizedBox(
          height: 200,
        ),
      ],
    );
  }
}
