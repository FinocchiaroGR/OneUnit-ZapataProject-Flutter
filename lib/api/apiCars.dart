import 'dart:convert';
import 'dart:developer';

import 'package:app/consts/api_urls.dart' as api_urls;
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiCars {
  Future getCars(String id, String token) async {
    try {
      String url = api_urls.cars.toString() + id;
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
      );
      debugPrint("JSON RESPOND");
      debugPrint(response.body.toString());
      var jsonDecoded = jsonDecode(response.body);
      var jsonRespond = json.encode({
        'body': jsonDecoded,
        'status': response.statusCode,
      });

      return jsonRespond;
    } catch (e) {
      log(e.toString());
    }
  }
}
