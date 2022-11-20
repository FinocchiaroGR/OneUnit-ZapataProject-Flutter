import 'dart:convert';
import 'dart:developer';

import 'package:app/consts/api_urls.dart' as api_urls;
import 'package:http/http.dart' as http;

class ApiUserInfo {
  Future getUser(String id, String token) async {
    try {
      String url = api_urls.user.toString() + id;
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
      );
      return json.decode(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  Future modValidity(String id, String token, String lic) async {
    try {
      String url = api_urls.userValidity.toString() + id;
      var response = await http.put(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{'licenceValidity': lic}),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
