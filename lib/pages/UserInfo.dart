import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;

import 'package:app/api/apiUserInfo.dart';
import 'package:app/models/UserModel.dart';

class UserInfo extends StatefulWidget {
  final String name = 'Juan Pablo Aldasoro';
  final String email = 'juan.pablo@hotmail.com';
  final String address = 'Blvd. Quintana 588, San Pedrito';
  final String birthDate = '24/08/1995';
  final String licenceValidity = '22/12/2025';

  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool circular = true;
  bool debugMode = true;
  ApiUserInfo networkHandler = ApiUserInfo();

  UserModel userModel = UserModel();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var response = await networkHandler.getUser();

    if (debugMode == true) {
      setState(() {
        circular = false;
        debugPrint("-- Debug Mode - Información de Usuario --");
      });
    } else {
      setState(() {
        userModel = UserModel.fromJson(response);
        circular = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Información",
      navigationCurrentIndex: 0,
      body: SingleChildScrollView(
        child: circular
            ? Center(
                child: Column(
                  children: const [
                    SizedBox(height: 200),
                    CircularProgressIndicator(),
                  ],
                ),
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
                    text: widget.name,
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
                    text: widget.email,
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
                    text: widget.address,
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
                    text: widget.birthDate,
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
                    text: widget.licenceValidity,
                    color: app_colors.primary,
                  ),
                  const SizedBox(height: 15),
                  AppButton(
                      text: "Editar", type: "secondary", onPressed: () => {}),
                ],
              ),
      ),
    );
  }
}
