import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Carousel.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/images.dart' as app_images;
import 'package:provider/provider.dart';

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, cars, child) {
        return AppPage(
          title: "FAQs",
          navigationCurrentIndex: 2,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const AppTypography(
                  align: TextAlign.center,
                  type: "h1",
                  text: "Preguntas Frecuentes",
                  color: app_colors.primary,
                ),
                const AppTypography(
                  align: TextAlign.left,
                  type: "body1",
                  text:
                      "La App de Grupo Zapata que vincula tu smartphone con tu auto para darte:",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 40),
                const AppTypography(
                  align: TextAlign.left,
                  type: "subtitle",
                  text: "Ubicación en Tiempo Real",
                  color: app_colors.primary,
                ),
                const AppTypography(
                  align: TextAlign.left,
                  type: "body2",
                  text:
                      "¡Crea una Geocerca y recibe alertas en caso de que el auto salga de la zona delimitada!",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 30),
                const AppTypography(
                  align: TextAlign.left,
                  type: "subtitle",
                  text: "Velocímetro en Tiempo Real",
                  color: app_colors.primary,
                ),
                const AppTypography(
                  align: TextAlign.left,
                  type: "body2",
                  text:
                      "¡Recibe alertas en caso de que tu auto sobrepase la velocidad que decidas establecer en los parámetros!",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 30),
                const AppTypography(
                  align: TextAlign.left,
                  type: "subtitle",
                  text: "Alerta de Movimiento",
                  color: app_colors.primary,
                ),
                const AppTypography(
                  align: TextAlign.left,
                  type: "body2",
                  text:
                      "Enciende el modo 'parking' para que te alerte si tu auto.se esta moviendo",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 30),
                const AppTypography(
                  align: TextAlign.left,
                  type: "subtitle",
                  text: "Concentra toda la información",
                  color: app_colors.primary,
                ),
                const AppTypography(
                  align: TextAlign.left,
                  type: "body2",
                  text:
                      "Recibe alertas acerca de la vigencia de toda tú documentación relacionada con tu auto.",
                  color: app_colors.primary,
                ),
                const SizedBox(height: 30),
                const AppTypography(
                  align: TextAlign.left,
                  type: "subtitle",
                  text: "Mantente siempre en contacto con Zapata",
                  color: app_colors.primary,
                ),
                const AppTypography(
                  align: TextAlign.start,
                  type: "body2",
                  text:
                      "Agenda tu cita de servicio y recibe ofertas personalizadas.",
                  color: app_colors.primary,
                ),
              ],
          ),
		  ),
        );
      },
    );
  }
}
