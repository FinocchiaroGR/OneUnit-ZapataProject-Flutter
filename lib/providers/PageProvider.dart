import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int _currentIndex = 0;

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}
