import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/styles/icons.dart' as app_icons;
import 'package:app/styles/colors.dart' as app_colors;

class AppCarousel extends StatefulWidget {
  final List<Map<dynamic, dynamic>> items;

  const AppCarousel({
    super.key,
    required this.items,
  });

  @override
  State<StatefulWidget> createState() => _StatefulAppCarouselState();
}

class _StatefulAppCarouselState extends State<AppCarousel> {
  final CarouselController _controller = CarouselController();
  String _name = '';

  void _changeName(index, reason) {
    setState(() {
      _name = widget.items[index]['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    _changeName(0, '');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> slides =
        widget.items.map((item) => Image.asset(item['src'])).toList();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
          )
        ],
      ),
    );
  }
}
