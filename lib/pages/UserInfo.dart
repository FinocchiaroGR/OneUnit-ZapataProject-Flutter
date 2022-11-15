import 'package:app/api/apiAuth.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;

import 'package:app/api/apiUserInfo.dart';
import 'package:app/models/UserModel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool loading = true;
  late String birth;
  late String lic;
  late UserModel userModel;
  ApiUserInfo networkHandler = ApiUserInfo();
  ApiLogin networkHandlerAuth = ApiLogin();

  @override
  void initState() {
    final id = Provider.of<UserProvider>(context, listen: false).getID();
    final token = Provider.of<UserProvider>(context, listen: false).getToken();
    super.initState();
    fetchData(id, token);
  }

  void fetchData(String? id, String? token) async {
    var response = await networkHandler.getUser(id!, token!);
    setState(() {
      userModel = UserModel.fromJson(response);
      if (userModel.licenceValidity != null) {
        lic = DateFormat("dd/MM/yyyy").format(
            DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .parse(userModel.licenceValidity.toString()));
      } else {
        lic =
            "Porfavor edite la fecha de expiración de la licencia de conducir";
      }
      birth = DateFormat("dd/MM/yyyy").format(
          DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
              .parse(userModel.birthDate.toString()));
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Información",
      navigationCurrentIndex: 0,
      body: loading
          ? const Center(
              child: SpinKitThreeBounce(
                color: app_colors.primary,
              ),
            )
          : SingleChildScrollView(
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
                    text: userModel.name.toString(),
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
                    text: userModel.email.toString(),
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
                    text: userModel.address.toString(),
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
                    text: birth,
                    color: app_colors.primary,
                  ),
                  const SizedBox(height: 20),
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
                    text: lic,
                    color: app_colors.primary,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        text: "Editar",
                        type: "primary",
                        onPressed: () => {},
                      ),
                      AppButton(
                          text: "Cerrar sesión",
                          type: "primary",
                          onPressed: () async {
                            var response = await networkHandlerAuth.logout(
                                userModel.email.toString(),
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .getToken()!);
                            if (response.statusCode == 200) {
                              Navigator.pushNamed(context, app_urls.login);
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
