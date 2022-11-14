import 'package:flutter/material.dart';

import 'package:app/providers/UserProvider.dart';
import 'package:provider/provider.dart';

import 'package:app/router.dart' as app_router;
import 'package:app/consts/urls.dart' as app_urls;
import 'package:app/styles/colors.dart' as app_colors;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, userprovider, _) {
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: app_colors.primary,
                    secondary: app_colors.secondary,
                  ),
            ),
            debugShowCheckedModeBanner: false,
            color: Colors.white,
            initialRoute: app_urls.login,
            routes: app_router.routes,
          );
        },
      ),
    ),
  );
}
