import 'package:flutter/material.dart';
import 'package:app/providers/UserProvider.dart';
import 'package:provider/provider.dart';

import 'package:app/router.dart' as app_router;

import 'package:app/consts/urls.dart' as app_urls;

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      initialRoute: app_urls.home,
      routes: app_router.routes,
    ),
  ));
}
