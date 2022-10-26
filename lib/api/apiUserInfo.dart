import 'dart:convert';
import 'dart:developer';

import 'package:app/consts/urls.dart';
import 'package:http/http.dart' as http;

class ApiUserInfo {
  Future getUser() async {
    try {
      //String token
      var response = await http.get(
        ApiConstants.apiUser,
        // headers: {"Authorization": "token"},
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }

      log(response.body);
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future modValidity() async {
    try {
      //String token
      var response = await http.put(
        ApiConstants.apiModValidity,
        // headers: {"Authorization": "token"},
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }

      log(response.body);
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
