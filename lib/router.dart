import 'package:app/consts/urls.dart' as app_urls;

import 'package:app/pages/ComponentsShowcase.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/UserInfo.dart';

final routes = {
  app_urls.home: (ctx) => const Dashboard(),
  app_urls.componentsShowcase: (ctx) => ComponentsShowcase(),
  app_urls.userInfo: (ctx) => const UserInfo(),
};
