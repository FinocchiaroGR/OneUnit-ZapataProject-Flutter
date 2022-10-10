
import 'dart:ui';
import './colors.dart';

import 'package:flutter/cupertino.dart';

const styleH1 = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],   // Segun internet es flutter todavia no soporta por completo tipografia segundaria.. esto es lo maximo que pude encontrar.
  fontWeight: FontWeight.w700,
  fontSize: 72.0,
  color: primario);

const styleH2 = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],
  fontWeight: FontWeight.w700,
  fontSize: 45.0,
  color: primario);

const styleH3 = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],
  fontWeight: FontWeight.w700,
  fontSize: 36.0,
  color: primario);

const styleH4 = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],
  fontWeight: FontWeight.w700,
  fontSize: 25.5,
  color: primario);

const styleH5 = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],
  fontWeight: FontWeight.w700,
  fontSize: 18.0,
  color: primario);

const styleBodyText = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
  color: primario);

const styleBodyTextSmall = TextStyle(
  fontFamily: 'HelveticaNeue',            // Falta importarla en pubspec
  fontFamilyFallback: ['BrowalliaNew'],
  fontWeight: FontWeight.w500,
  fontSize: 10.0,
  color: primario);