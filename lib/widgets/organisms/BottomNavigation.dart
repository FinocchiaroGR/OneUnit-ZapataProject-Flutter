import 'package:flutter/material.dart';
import 'package:app/consts/urls.dart' as app_urls;
import "package:app/styles/icons.dart" as app_icons;
import "package:app/styles/colors.dart" as app_colors;

class AppBottomNavigation extends StatefulWidget {
  final int selectedIndex;
  const AppBottomNavigation({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<StatefulWidget> createState() => _AppBottomNavigationState();
}

class _AppBottomNavigationState extends State<AppBottomNavigation> {
  static const Map<int, String> _pagesMap = {
    0: app_urls.userInfo,
    1: app_urls.home,
    2: app_urls.componentsShowcase,
  };

  void _onItemTapped(int index) {
    Navigator.pushNamed(context, _pagesMap[index] ?? app_urls.home);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(app_icons.user),
          label: "Usuario",
          backgroundColor: app_colors.secondary,
        ),
        BottomNavigationBarItem(
          icon: Icon(app_icons.home),
          label: "Inicio",
          backgroundColor: app_colors.secondary,
        ),
        BottomNavigationBarItem(
          icon: Icon(app_icons.help),
          label: "Ayuda",
          backgroundColor: app_colors.secondary,
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: app_colors.background,
      iconSize: 40,
    );
  }
}
