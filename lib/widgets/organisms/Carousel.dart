import 'package:app/models/CarModel.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:app/utils/launch_whatsapp.dart';
import 'package:app/widgets/molecules/IconButton.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:app/widgets/atoms/Typography.dart';

import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/styles/colors.dart' as app_colors;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:provider/provider.dart';

class AppCarousel extends StatefulWidget {
  final List<CarModel> cars;

  const AppCarousel({
    super.key,
    required this.cars,
  });

  @override
  State<StatefulWidget> createState() => _StatefulAppCarouselState();
}

class _StatefulAppCarouselState extends State<AppCarousel> {
  final CarouselController _controller = CarouselController();
  String _name = '';
  int _id = 0;

  void _changeName(index, reason) {
    setState(() {
      _name = "${widget.cars[index].brandName} ${widget.cars[index].modelYear}";
      _id = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _changeName(0, '');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slides = widget.cars
        .map(
            (car) => Image.network("http://localhost:1337/images/${car.image}"))
        .toList();

    return Consumer<UserProvider>(
      builder: (context, list, child) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CarouselSlider(
                  items: slides,
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: false,
                    onPageChanged: _changeName,
                    viewportFraction: 1,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: _controller.previousPage,
                      icon: const Icon(
                        app_icons.arrowLeft,
                        size: 20,
                        color: app_colors.primary,
                      )),
                  AppTypography(
                    text: _name,
                    align: TextAlign.center,
                    type: "h3",
                    color: app_colors.primary,
                  ),
                  IconButton(
                    onPressed: _controller.nextPage,
                    icon: const Icon(
                      app_icons.arrowRight,
                      size: 20,
                      color: app_colors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppIconButton(
                    text: "Documentos \nvigentes",
                    icon: app_icons.documents,
                    onPressed: () => Navigator.pushNamed(
                        context, app_urls.documents,
                        arguments: _id),
                  ),
                  AppIconButton(
                    text: "Localizar \nautomóvil",
                    icon: app_icons.geoFence,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        app_urls.carLocation,
                        arguments: {
                          "idCar": _id,
                          "idGPS": list.cars[_id].idGPS
                        },
                      );
                      Provider.of<UserProvider>(context, listen: false)
                          .saveIdGps(list.cars[_id].idGPS!.toInt());
                    },
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
        );
      },
    );
  }
}
