import 'package:app/providers/UserProvider.dart';
import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Carousel.dart';

import 'package:app/consts/images.dart' as app_images;
import 'package:provider/provider.dart';

const dummyCarSlides = [
  {
    'src': app_images.logo,
    'name': 'OneUnit',
  },
  {
    'src': "https://picsum.photos/200/300",
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
    return Consumer<UserProvider>(
      builder: (context, cars, child) {
        return AppPage(
          title: "Bienvenido",
          navigationCurrentIndex: 1,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppCarousel(cars: cars.cars),
              ],
            ),
          ),
        );
      },
    );
  }
}
