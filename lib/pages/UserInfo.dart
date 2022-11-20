import 'package:app/api/apiAuth.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/styles/icons.dart' as app_icons;

import 'package:app/api/apiUserInfo.dart';
import 'package:app/models/UserModel.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  late String birth;
  late String lic;
  late UserModel userModel;
  late var date;
  DateTime selectedDate = DateTime.now();
  ApiUserInfo networkHandler = ApiUserInfo();
  ApiLogin networkHandlerAuth = ApiLogin();

  String formatBirth(String birthDate) {
    birth = DateFormat("dd/MM/yyyy")
        .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(birthDate));
    return birth;
  }

  String formatLic(license) {
    if (license != null) {
      lic = DateFormat("dd/MM/yyyy").format(
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(license.toString()));
    } else {
      lic = "Porfavor edite la fecha de expiración:";
    }
    return lic;
  }

  Future<void> _selectDate(
      BuildContext context, String id, String token, user) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: const Locale("es", "MX"),
        helpText:
            "Selecciona la fecha de expiración\nde tu licencia de\nconducir:",
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime(2050));
    if (picked != null) {
      date = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(picked);
      setState(() {
        formatLic(date.toString());
      });
      _updateLic(date.toString(), id, token, user);
    }
  }

  void _updateLic(String date, String id, String token, user) {
    user.user.licenceValidity = date;
    networkHandler.modValidity(id, token, date);
  }

  void _goLogin() {
    Navigator.pushNamed(context, app_urls.login);
    Provider.of<UserProvider>(context, listen: false).deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return AppPage(
          title: "Información",
          navigationCurrentIndex: 0,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AppTypography(
                  align: TextAlign.left,
                  type: "h3",
                  text: "Nombre:",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 5),
                AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: user.user.name.toString(),
                  color: app_colors.primary,
                ),
                const SizedBox(height: 20),
                const AppTypography(
                  align: TextAlign.left,
                  type: "h3",
                  text: "Correo:",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 5),
                AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: user.user.email.toString(),
                  color: app_colors.primary,
                ),
                const SizedBox(height: 20),
                const AppTypography(
                  align: TextAlign.left,
                  type: "h3",
                  text: "Dirección:",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 5),
                AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: user.user.address.toString(),
                  color: app_colors.primary,
                ),
                const SizedBox(height: 20),
                const AppTypography(
                  align: TextAlign.left,
                  type: "h3",
                  text: "Fecha de nacimiento:",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 5),
                AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text: formatBirth(user.user.birthDate.toString()),
                  color: app_colors.primary,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppTypography(
                            align: TextAlign.left,
                            type: "h3",
                            text: "Fecha Expiración LDC:",
                            color: app_colors.primary,
                          ),
                          const SizedBox(height: 5),
                          AppTypography(
                            align: TextAlign.left,
                            type: "body1",
                            text: formatLic(user.user.licenceValidity),
                            color: app_colors.primary,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(app_icons.pencil),
                      color: app_colors.primary,
                      onPressed: () => _selectDate(context, user.id.toString(),
                          user.token.toString(), user),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                AppButton(
                  text: "Cerrar sesión",
                  type: "primary",
                  onPressed: () async {
                    var response = await networkHandlerAuth.logout(
                        user.user.email.toString(), user.token.toString());
                    if (response.statusCode == 200) {
                      _goLogin();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
