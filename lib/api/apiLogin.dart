import 'dart:convert';
import 'dart:developer';

import 'package:app/consts/api_urls.dart' as api_urls;
import 'package:app/providers/UserProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiLogin {
  Future login(String email, String password) async {
    try {
      //String token
      var response = await http.post(
        api_urls.login,
        // headers: {"Authorization": "token"},
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
