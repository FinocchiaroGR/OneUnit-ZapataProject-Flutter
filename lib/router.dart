import 'package:app/consts/urls.dart' as app_urls;

import 'package:app/pages/ComponentsShowcase.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:flutter/cupertino.dart';

import 'package:app/widgets/atoms/LocationMap.dart';

final Map<String, WidgetBuilder> routes = {
  app_urls.home: (ctx) => const Dashboard(),
  app_urls.componentsShowcase: (ctx) => ComponentsShowcase(),
};
