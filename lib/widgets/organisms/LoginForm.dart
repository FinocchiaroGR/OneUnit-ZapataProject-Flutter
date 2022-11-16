import 'dart:convert';

import 'package:app/api/apiAuth.dart';
import 'package:app/api/apiCars.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/widgets/atoms/Button.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/styles/icons.dart' as app_icons;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AppLoginForm extends StatefulWidget {
  const AppLoginForm({super.key});

  @override
  State<AppLoginForm> createState() => _AppLoginFormState();
}

class _AppLoginFormState extends State<AppLoginForm> {
  late bool loading = false;
  late bool error = false;
  final String message = "Usuario no registrado";
  final formKey = GlobalKey<FormState>();
  final ApiLogin authNetworkHandler = ApiLogin();
  final ApiCars carsNetworkHandler = ApiCars();
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
    var authResponse = await authNetworkHandler.login(email, password);
    if (jsonDecode(authResponse)['status'] == 200) {
      setUserProvider(jsonDecode(authResponse)['id'].toString(),
          jsonDecode(authResponse)['token'].toString());

      var carsResponse = await carsNetworkHandler.getCars(
          jsonDecode(authResponse)['id'].toString(),
          jsonDecode(authResponse)['token'].toString());

      if (jsonDecode(carsResponse)['status'] == 200) {
        setCarsProvider(jsonDecode(authResponse)['id'].toString(),
            jsonDecode(authResponse)['token'].toString(), carsResponse);

        Navigator.pushNamed(context, app_urls.home);

        setState(() {
          dispose();
          loading = false;
        });
      } else {
        setState(() {
          error = true;
          loading = false;
        });
      }
    } else {
      setState(() {
        error = true;
        loading = false;
      });
    }
  }

  void setCarsProvider(String id, String token, response) =>
      Provider.of<UserProvider>(context, listen: false)
          .saveCars(id, token, response);

  void setUserProvider(String id, String token) =>
      Provider.of<UserProvider>(context, listen: false).signIn(id, token);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          error
              ? SizedBox(
                  height: 25,
                  child: AppTypography(
                    text: message,
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
