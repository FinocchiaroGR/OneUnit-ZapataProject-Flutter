/*import 'package:flutter/material.dart';

import 'package:app/widgets/atoms/Button.dart';

import 'package:app/consts/urls.dart' as app_urls;

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          text: "go to showcase",
          onPressed: () =>
              Navigator.pushNamed(context, app_urls.componentsShowcase),
        ),
        AppButton(
          text: "go to car location",
          onPressed: () => Navigator.pushNamed(context, app_urls.carLocation),
        ),
      ],
    );
  }
}
*/

import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Carousel.dart';
import 'package:app/widgets/molecules/IconButton.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/styles/colors.dart' as app_colors;
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
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 178,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const AppCarousel(items: dummyCarSlides),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: AppIconButton(
                              text: "Mis \ndocumentos",
                              icon: app_icons.documents,
                              onPressed: () => Navigator.pushNamed(
                                  context, app_urls.carInfo),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: AppIconButton(
                              text: "Localizar \nautomóvil",
                              icon: app_icons.geoFence,
                              onPressed: () => Navigator.pushNamed(
                                  context, app_urls.carLocation),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 20),
                            child: AppIconButton(
                              text: "Agendar \nservicio",
                              icon: app_icons.service,
                              onPressed: () => {},
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: 10.0, bottom: 20),
                            child: AppIconButton(
                              text: "Vender \nautomóvil",
                              icon: app_icons.sellCar,
                              onPressed: () => {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
