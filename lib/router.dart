import 'package:app/consts/urls.dart' as app_urls;

import 'package:app/pages/ComponentsShowcase.dart';
import 'package:app/pages/Dashboard.dart';

final routes = {
  app_urls.home: (ctx) => ComponentsShowcase(),
  app_urls.componentsShowcase: (ctx) => const Dashboard(),
};
