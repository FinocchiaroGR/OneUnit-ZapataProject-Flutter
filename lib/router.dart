import 'package:app/consts/urls.dart' as app_urls;

import 'package:app/pages/ComponentsShowcase.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/UserInfo.dart';
import 'package:app/pages/CarLocation.dart';
import 'package:app/pages/AutoInfoForm.dart';

final routes = {
  app_urls.home: (ctx) => const Dashboard(),
  app_urls.componentsShowcase: (ctx) => const ComponentsShowcase(),
  app_urls.userInfo: (ctx) => const UserInfo(
        nombre: 'Juan Pablo Aldasoro',
        correo: 'juan.pablo@hotmail.com',
        dir: 'Blvd. Quintana 588, San Pedrito',
        birth: '24/08/1995',
        lic: '22/12/2025',
      ),
  app_urls.carLocation: (ctx) => const CarLocation(),
  app_urls.carInfo: (ctx) => const FormAuto(),
};
