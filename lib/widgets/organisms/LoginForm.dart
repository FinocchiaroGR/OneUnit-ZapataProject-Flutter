import 'dart:convert';

import 'package:app/api/apiAuth.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/styles/icons.dart' as app_icons;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class AppLoginForm extends StatefulWidget {
  const AppLoginForm({super.key});

  @override
  State<AppLoginForm> createState() => _AppLoginFormState();
}

class _AppLoginFormState extends State<AppLoginForm> {
  bool loading = false;
  bool error = false;
  bool logedIn = false;
  final formKey = GlobalKey<FormState>();
  ApiLogin networkHandler = ApiLogin();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController;
    _passwordController;
  }

  void fetchData(String email, String password) async {
    setState(() {
      error = false;
      loading = true;
    });
    var response = await networkHandler.login(email, password);
    if (response.statusCode.toDouble() == 200) {
      setUserProvider(response);
      Navigator.pushNamed(context, app_urls.home);
      setState(() {
        loading = false;
        logedIn = true;
      });
    } else {
      setState(() {
        error = true;
        loading = false;
      });
    }
  }

  void setUserProvider(response) =>
      Provider.of<UserProvider>(context, listen: false).signIn(
          jsonDecode(response.body)['id'].toString(),
          jsonDecode(response.body)['token'].toString());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          error
              ? const SizedBox(
                  height: 25,
                  child: AppTypography(
                    text: "Usuario no registrado",
                    type: "body2",
                    color: Colors.red,
                  ))
              : const SizedBox(
                  height: 8,
                ),
          const AppTypography(
            align: TextAlign.left,
            type: "body1",
            text: "Correo:",
            color: app_colors.primary,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: false,
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Correo Electrónico',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: app_colors.primary, width: 2.0),
              ),
              prefixIcon: Icon(app_icons.user),
              prefixIconColor: app_colors.primary,
            ),
            validator: (email) {
              if (email == null ||
                  email.isEmpty ||
                  !email.contains('@') ||
                  !email.contains('.')) {
                return 'Ingresa un correo electrónico válido';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const AppTypography(
            align: TextAlign.left,
            type: "body1",
            text: "Contraseña:",
            color: app_colors.primary,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'Contraseña',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: app_colors.primary, width: 2.0),
              ),
              prefixIcon: Icon(app_icons.lock),
            ),
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Ingresa la contraseña de tu cuenta';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          loading
              ? const SpinKitThreeBounce(
                  color: app_colors.primary,
                )
              : Center(
                  child: AppButton(
                    text: "Iniciar sesión",
                    onPressed: () {
                      setState(() {
                        error = false;
                      });
                      if (formKey.currentState!.validate()) {
                        fetchData(
                            _emailController.text, _passwordController.text);
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
