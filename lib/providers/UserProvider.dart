import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  int _currentIndex = 0;

  void setIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}
