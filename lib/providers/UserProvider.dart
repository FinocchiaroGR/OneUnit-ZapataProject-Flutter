import 'dart:collection';
import 'dart:convert';

import 'package:app/models/CarModel.dart';
import 'package:app/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserProvider extends ChangeNotifier {
  late String _id;
  late String _token;
  final List<CarModel> _cars = [];
  late UserModel _user;

  String get id => _id;
  String get token => _token;
  UserModel get user => _user;

  UnmodifiableListView<CarModel> get cars => UnmodifiableListView(_cars);

  void signIn(String id, String token) {
    _id = id;
    _token = token;
    notifyListeners();
  }

  void getInfo(jsonRespond) {
    _user = UserModel.fromJson(jsonRespond);
  }

  void saveCars(jsonRespond) {
    for (int i = 0; i < jsonDecode(jsonRespond)["body"].length; i++) {
      _cars.add(CarModel.fromJson(jsonDecode(jsonRespond)["body"][i]));
      notifyListeners();
    }
  }

  void deleteAll() {
    _id = "";
    _token = "";
    _cars.clear();
    _user = _user.Delete();
  }

  String? getID() => _id;
  String? getToken() => _token;
  List<CarModel>? getCars() => _cars;
}
