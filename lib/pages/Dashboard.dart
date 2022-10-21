import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Carousel.dart';
import 'package:app/widgets/molecules/IconButton.dart';

import 'package:app/utils/launch_whatsapp.dart';

import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/consts/images.dart' as app_images;
import 'package:app/consts/urls.dart' as app_urls;

const dummyCarSlides = [
  {
    'src': app_images.logo,
    'name': 'OneUnit',
  },
  {
    'src': app_images.carPlaceholder,
    'name': 'Zapata',
  },
  {
    'src': app_images.carPlaceholder,
    'name': 'Connect',
  },
  {
    'src': app_images.carPlaceholder,
    'name': 'For clients',
  },
];

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Bienvenido",
      navigationCurrentIndex: 1,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const AppCarousel(items: dummyCarSlides),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppIconButton(
                  text: "Mis \ndocumentos",
                  icon: app_icons.documents,
                  onPressed: () =>
                      Navigator.pushNamed(context, app_urls.documents),
                ),
                AppIconButton(
                  text: "Localizar \nautomóvil",
                  icon: app_icons.geoFence,
                  onPressed: () =>
                      Navigator.pushNamed(context, app_urls.carLocation),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                AppIconButton(
                  text: "Agendar \nservicio",
                  icon: app_icons.service,
                  onPressed: () => launchWhatsapp(
                    context: context,
                    phone: "+524426693737",
                    text: "Quiero agendar un servicio",
                  ),
                ),
                AppIconButton(
                  text: "Vender \nautomóvil",
                  icon: app_icons.sellCar,
                  onPressed: () => launchWhatsapp(
                    context: context,
                    phone: "+524426693737",
                    text: "Quiero vender mi auto",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
