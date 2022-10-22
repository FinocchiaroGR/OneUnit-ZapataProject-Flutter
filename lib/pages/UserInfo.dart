import 'package:app/NetworkHandler.dart';
import 'package:app/model/UserModel.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';

import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

class UserInfo extends StatefulWidget {
  final String nombre;
  final String correo;
  final String dir;
  final String birth;
  final String lic;

  const UserInfo({
    super.key,
    required this.nombre,
    required this.correo,
    required this.dir,
    required this.birth,
    required this.lic,
  });

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool circular = true;
  NetworkHandler networkHandler = NetworkHandler();

  UserModel userModel = UserModel();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.getUser();
    setState(() {
      userModel = UserModel.fromJson(response);
      circular = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Información",
      navigationCurrentIndex: 0,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: circular
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
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
                        text: userModel.nombre.toString(),
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
                        text: userModel.correo.toString(),
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
                        text: userModel.dir.toString(),
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
                        text: userModel.birth.toString(),
                        color: app_colors.primary,
                      ),
                      const SizedBox(height: 20),
                      const AppTypography(
                        align: TextAlign.left,
                        type: "h3",
                        text: "Expiración LDC:",
                        color: app_colors.primary,
                      ),
                      const SizedBox(height: 5),
                      AppTypography(
                        align: TextAlign.left,
                        type: "body1",
                        text: userModel.lic.toString(),
                        color: app_colors.primary,
                      ),
                      const SizedBox(height: 15),
                      AppButton(
                          text: "Editar",
                          type: "secondary",
                          onPressed: () => {}),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
