import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/Page.dart';
import 'package:app/widgets/organisms/Carousel.dart';
import 'package:app/widgets/molecules/IconButton.dart';
import 'package:app/widgets/atoms/Button.dart';
import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/consts/images.dart' as app_images;

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

class ComponentsShowcase extends StatelessWidget {
  const ComponentsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: "Showcase",
      navigationCurrentIndex: 2,
      body: Column(
        children: <Widget>[
          const AppCarousel(items: dummyCarSlides),
          const AppTypography(
            align: TextAlign.left,
            type: "h1",
            text: "This is an h1",
            color: app_colors.primary,
          ),
          const AppTypography(
            align: TextAlign.left,
            type: "h2",
            text: "This is an h2",
            color: app_colors.primary,
          ),
          const AppTypography(
            align: TextAlign.left,
            type: "h3",
            text: "This is an h3",
            color: app_colors.primary,
          ),
          const AppTypography(
            align: TextAlign.left,
            type: "subtitle",
            text: "This is a subtitle",
            color: app_colors.primary,
          ),
          const AppTypography(
            align: TextAlign.left,
            type: "body1",
            text: "This is a body1",
            color: app_colors.primary,
          ),
          const AppTypography(
            align: TextAlign.left,
            type: "body2",
            text: "This is a body2",
            color: app_colors.primary,
          ),
          AppButton(text: "Click here", onPressed: () => {}),
          AppIconButton(
            text: "Some text",
            icon: app_icons.sellCar,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
