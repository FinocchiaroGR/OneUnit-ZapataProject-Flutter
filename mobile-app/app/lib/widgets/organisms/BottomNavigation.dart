import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/PageProvider.dart';
import "package:app/styles/icons.dart" as app_icons;
import "package:app/styles/colors.dart" as app_colors;

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, page, child) => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(app_icons.user),
            label: "Usario",
            backgroundColor: app_colors.secondary,
          )
        ],
        currentIndex: page.getIndex(),
        onTap: page.setIndex,
        backgroundColor: app_colors.background,
        iconSize: 40,
      ),
    );
  }
}
