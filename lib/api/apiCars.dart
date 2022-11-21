import 'dart:convert';
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

  Future modPolicy(String id, String token, String date) async {
    try {
      String url = api_urls.carInsuPol.toString() + id;
      var response = await http.put(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{'insurancePolicyValidity': date}),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future modCirculation(String id, String token, String date) async {
    try {
      String url = api_urls.carCirVal.toString() + id;
      var response = await http.put(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{'circulationCardValidity': date}),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future modVerification(String id, String token, String date) async {
    try {
      String url = api_urls.carVeriVal.toString() + id;
      var response = await http.put(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, String>{'verificationValidity': date}),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
