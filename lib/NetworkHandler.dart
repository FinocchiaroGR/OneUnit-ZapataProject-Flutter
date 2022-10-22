import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:app/consts/urls.dart';

class NetworkHandler {
  Future getUser() async {
    try {
      //String token
      var response = await http.get(
        ApiConstants.apiUser,
        headers: {"Authorization": "token"},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body);

        return json.decode(response.body);
      }
      log(response.body);
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
