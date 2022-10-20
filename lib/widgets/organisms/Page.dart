import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/AppBar.dart';
import 'package:app/widgets/organisms/BottomNavigation.dart';
import 'package:app/styles/colors.dart' as app_colors;

class AppPage extends StatelessWidget {
  final bool hasAppBar;
  final bool hasBottomNavigation;
  final bool hasPadding;
  final int navigationCurrentIndex;
  final String title;
  final Widget body;

  const AppPage({
    super.key,
    this.hasAppBar = true,
    this.hasBottomNavigation = true,
    this.hasPadding = true,
    this.navigationCurrentIndex = 1,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppBar ? AppAppBar(title: title) : null,
      bottomNavigationBar: hasBottomNavigation
          ? AppBottomNavigation(selectedIndex: navigationCurrentIndex)
          : null,
      backgroundColor: app_colors.background,
      resizeToAvoidBottomInset: false,
      body: body,
    );
  }
}
