import 'package:app/api/apiCars.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/styles/icons.dart' as app_icons;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AppValidity extends StatefulWidget {
  const AppValidity({
    super.key,
  });

  @override
  State<AppValidity> createState() => _AppValidityState();
}

class _AppValidityState extends State<AppValidity> {
  late String dateString;
  DateTime selectedDate = DateTime.now();
  ApiCars networkHandler = ApiCars();
  late var date;

  String formatDate(date) {
    if (date != null) {
      dateString = DateFormat("dd/MM/yyyy").format(
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date.toString()));
    } else {
      dateString = "Porfavor edite la fecha de expiración";
    }
    return dateString;
  }

  Future<void> _selectDate(
      BuildContext context, String token, car, int type) async {
    debugPrint(car.toString());
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: const Locale("es", "MX"),
        helpText: "Selecciona la fecha de expiración\n",
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2050));
    if (picked != null) {
      date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(picked);
      setState(() {
        formatDate(date.toString());
      });
      _updateDate(date.toString(), car.id.toString(), token, car, type);
    }
  }

  void _updateDate(String date, String id, String token, car, int type) {
    if (type == 1) {
      car.insurancePolicyValidity = date;
      networkHandler.modPolicy(id, token, date);
    } else if (type == 2) {
      car.circulationCardValidity = date;
      networkHandler.modCirculation(id, token, date);
    } else {
      car.verificationValidity = date;
      networkHandler.modVerification(id, token, date);
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)?.settings.arguments as int);
    return Consumer<UserProvider>(
      builder: (context, list, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTypography(
                          align: TextAlign.left,
                          type: "h3",
                          text: "Póliza de seguros",
                          color: app_colors.primary,
                        ),
                        AppTypography(
                          align: TextAlign.left,
                          type: "body1",
                          text:
                              formatDate(list.cars[id].insurancePolicyValidity),
                          color: app_colors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(app_icons.pencil),
                  color: app_colors.primary,
                  onPressed: () =>
                      _selectDate(context, list.token, list.cars[id], 1),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTypography(
                          align: TextAlign.left,
                          type: "h3",
                          text: "Tarjeta de circulación",
                          color: app_colors.primary,
                        ),
                        AppTypography(
                          align: TextAlign.left,
                          type: "body1",
                          text:
                              formatDate(list.cars[id].circulationCardValidity),
                          color: app_colors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(app_icons.pencil),
                  color: app_colors.primary,
                  onPressed: () =>
                      _selectDate(context, list.token, list.cars[id], 2),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTypography(
                          align: TextAlign.left,
                          type: "h3",
                          text: "Verificación vehicular",
                          color: app_colors.primary,
                        ),
                        AppTypography(
                          align: TextAlign.left,
                          type: "body1",
                          text: formatDate(list.cars[id].verificationValidity),
                          color: app_colors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(app_icons.pencil),
                  color: app_colors.primary,
                  onPressed: () =>
                      _selectDate(context, list.token, list.cars[id], 3),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
