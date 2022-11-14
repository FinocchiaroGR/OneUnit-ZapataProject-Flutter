import 'dart:convert';
import 'dart:developer';

import 'package:app/consts/api_urls.dart' as api_urls;
import 'package:http/http.dart' as http;

class ApiUserInfo {
  Future getUser(String id, String token) async {
    try {
      String url = api_urls.user.toString() + id!;
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future modValidity() async {
    try {
      //String token
      var response = await http.put(
        api_urls.userValidity,
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
