import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:app/widgets/atoms/Typography.dart";
import "package:app/styles/icons.dart" as app_icons;
import 'package:app/consts/images.dart' as app_images;
import "package:app/styles/colors.dart" as app_colors;

final List<Map<dynamic, dynamic>> infoList = [
  {'img': app_images.carPlaceholder, 'name': "Audi Something"},
  {'img': app_images.carPlaceholder, 'name': "Audi Something 1"},
  {'img': app_images.carPlaceholder, 'name': "Audi Something 2"},
  {'img': app_images.carPlaceholder, 'name': "Audi Something 3"},
];

final List<Widget> imageSliders = infoList
    .map(
      (item) => Container(
        margin: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Column(
              children: <Widget>[
                Image.asset(item['img'], fit: BoxFit.cover, width: 300),
                AppTypography(
                  align: TextAlign.center,
                  type: "h3",
                  text: item['name'],
                  color: app_colors.primary,
                ),
              ],
            )),
      ),
    )
    .toList();

class CarouselDemo extends StatelessWidget {
  final CarouselController buttonCarouselController = CarouselController();

  CarouselDemo({super.key});

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: imageSliders,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 2,
          ),
        ),
        IconButton(
          icon: const Icon(app_icons.arrowLeft),
          onPressed: () => buttonCarouselController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear),
        ),
        IconButton(
          icon: const Icon(app_icons.arrowRight),
          onPressed: () => buttonCarouselController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear),
        ),
      ]);
}
