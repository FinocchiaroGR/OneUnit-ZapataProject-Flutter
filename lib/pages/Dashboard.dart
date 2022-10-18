import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Button.dart';

import 'package:app/consts/urls.dart' as app_urls;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: "go to showcase",
          onPressed: () =>
              Navigator.pushNamed(context, app_urls.componentsShowcase),
        ),
        AppButton(
          text: "go to car location",
          onPressed: () => Navigator.pushNamed(context, app_urls.carLocation),
        ),
      ],
    );
  }
}
