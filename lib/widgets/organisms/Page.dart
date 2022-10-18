import 'package:flutter/material.dart';

import 'package:app/widgets/organisms/AppBar.dart';
import 'package:app/widgets/organisms/BottomNavigation.dart';

class AppPage extends StatelessWidget {
  final bool hasAppBar;
  final bool hasBottomNavigation;
  final int navigationCurrentIndex;
  final String title;
  final Widget body;

  const AppPage({
    super.key,
    this.hasAppBar = true,
    this.hasBottomNavigation = true,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: body,
          ),
        ),
      ),
    );
  }
}
