import 'package:flutter/material.dart';
import 'package:app/pages/LoginPage.dart';
import 'package:app/widgets/atoms/Button.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return AppButton(
        text: "Login",
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            ));
  }
}
