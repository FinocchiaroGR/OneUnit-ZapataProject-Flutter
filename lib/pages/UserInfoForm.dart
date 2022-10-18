import 'package:app/widgets/organisms/FormUser.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/atoms/Button.dart';

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({super.key});
  @override
  Widget build(BuildContext context) {
    return AppButton(
        text: "info user",
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormUser(),
              ),
            ));
  }
}
