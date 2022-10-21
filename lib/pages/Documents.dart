import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Validity.dart';

class Documents extends StatelessWidget {
  const Documents({super.key});
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Documentos",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [AppValidity()],
      ),
    );
  }
}
