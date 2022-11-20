import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Validity.dart';

class Documents extends StatelessWidget {
  final String circulationCardValidity = "24/03/2023";
  final String insurancePolicyValidity = "12/11/2024";
  final String vehicleVerificationValidity = "31/01/2025";

  const Documents({super.key});
  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Vigencias",
      body: AppValidity(
        circulationCard: circulationCardValidity,
        insurancePolicy: insurancePolicyValidity,
        vehicleVerification: vehicleVerificationValidity,
      ),
    );
  }
}
