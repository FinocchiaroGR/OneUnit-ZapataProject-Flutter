import 'dart:convert';
import 'dart:developer';

import 'package:app/consts/api_urls.dart' as api_urls;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiGps {
  Future getGpsInfo(int idGPS, String token) async {
    try {
      String url = api_urls.gps.toString() + idGPS.toString();
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
      );
      var jsonDecoded = jsonDecode(response.body);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
