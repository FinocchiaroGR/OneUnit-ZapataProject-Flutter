import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:http/http.dart';

class AppInputLoginForm extends StatefulWidget {
  const AppInputLoginForm({super.key});

  @override
  _AppInputLoginFormState createState() => _AppInputLoginFormState();
}

class _AppInputLoginFormState extends State<AppInputLoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    print(email + " " + password);
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data['token']);
        print('Login successfully');
      } else {
        print(response.statusCode);
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
        TextFormField(
          obscureText: false,
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Correo',
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
        TextFormField(
          obscureText: true,
          controller: passwordController,
          decoration: const InputDecoration(
            hintText: 'Contraseña',
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
