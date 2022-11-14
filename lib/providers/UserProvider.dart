import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String? _id;
  String? _token;

  void signIn(String id, String token) {
    _id = id;
    _token = token;
    notifyListeners();
  }

  void deleteAll() {
    _id = null;
    _token = null;
  }

  String? getID() => _id;
  String? getToken() => _token;
}
