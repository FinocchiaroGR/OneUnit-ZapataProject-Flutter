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
					type: "h3",
					text: "¿Cuál es la diferencia horaria entre Qatar, Argentina/México/España/Sudamérica?",
					color: app_colors.primary,
				),
				const AppTypography(
					align: TextAlign.left,
					type: "body2",
					text: "Qatar se encuentra dentro del huso horario UTC/GMT +3 horas. Para tenerlo en cuenta en otros lugares del planeta a la hora de saber los horarios de cada partido. Por ejemplo, en Argentina serían seis horas menos como buena parte de Sudamérica, en España dos horas y en México ocho horas menos.",
					color: app_colors.primary,
				),
					const AppTypography(
					align: TextAlign.left,
					type: "h3",
					text: "¿Cuánto gana el campeón del Mundial de Qatar 2022?",
					color: app_colors.primary,
				),
				const AppTypography(
					align: TextAlign.left,
					type: "body2",
					text: "La FIFA ha dispuesto una cuantía global en premios de 440 millones de dólares. De los cuáles, 42 millones de dólares irán destinados a la selección vencedora, y 30 millones al subcampeón.",
					color: app_colors.primary,
				),
					const AppTypography(
					align: TextAlign.left,
					type: "h3",
					text: "¿Qué jugadores jugarán su último Mundial en 2022?",
					color: app_colors.primary,
				),
				const AppTypography(
					align: TextAlign.left,
					type: "body2",
					text: "Es difícil pronosticar que jugadores de primer orden mundial disputarán su última cita de esta entidad. Por edad, es previsible que jugadores que han marcado los últimos años del fútbol al más alto nivel como Cristiano Ronaldo, Leo Messi, Diego Godín o Sergio Busquets se encuentren en esa tesitura.",
					color: app_colors.primary,
				),
					const AppTypography(
					align: TextAlign.left,
					type: "h3",
					text: "¿Qué selecciones africanas clasificaron para Qatar 2022?",
					color: app_colors.primary,
				),
				const AppTypography(
					align: TextAlign.left,
					type: "body2",
					text: "En esta ocasión, Camerún, Ghana, Marruecos, Senegal y Túnez son las cinco naciones encargadas de representar al continente africano en el Mundial de Qatar 2022.",
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
