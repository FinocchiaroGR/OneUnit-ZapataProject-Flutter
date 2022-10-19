import 'package:app/widgets/organisms/FormAuto.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/atoms/Button.dart';

class AutoInfoForm extends StatelessWidget {
  const AutoInfoForm({super.key});
  @override
  Widget build(BuildContext context) {
    return AppButton(
        text: "info auto",
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormAuto(),
              ),
            ));
  }
}
