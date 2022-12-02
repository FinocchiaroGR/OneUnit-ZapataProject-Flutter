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

  Future updateCarGeofence(int idGPS, String token, int carGeofence) async {
    try {
      String url = api_urls.carGeofence.toString() + idGPS.toString();
      var response = await http.put(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, int>{'geofenceRadiusKm': carGeofence}),
      );
      var jsonDecoded = jsonDecode(response.body);

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  Future activateGeofence(int idGPS, String token, int carGeofence) async {
    try {
      String url = api_urls.activateGeofence.toString() + idGPS.toString();
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode(<String, int>{'geofenceRadiusKm': carGeofence}),
      );

      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  Future deactivateGeofence(int idGPS, String token) async {
    try {
      String url = api_urls.deactivateGeofence.toString() + idGPS.toString();
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": 'Bearer $token',
          "Content-Type": "application/json"
        },
      );

      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
