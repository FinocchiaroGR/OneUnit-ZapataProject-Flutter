import 'dart:developer';

import 'package:app/consts/api_urls.dart' as api_urls;
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

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
