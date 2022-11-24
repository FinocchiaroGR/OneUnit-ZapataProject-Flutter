import 'dart:ffi';

class GpsModel {
  int? id;
  String? alias;
  Double? latitude;
  Double? longitude;
  Double? orientation;
  Double? velocity;
  Bool? active;
  Double? geofenceRadiusKm;
  Double? geofenceLat;
  Double? geofenceLong;
  Bool? geofenceActive;

  GpsModel({
    this.id,
    this.alias,
    this.latitude,
    this.longitude,
    this.orientation,
    this.velocity,
    this.active,
    this.geofenceRadiusKm,
    this.geofenceLat,
    this.geofenceLong,
    this.geofenceActive,
  });

  factory GpsModel.fromJson(Map<String, dynamic> json) =>
      _$GpsModelFromJson(json);
}

GpsModel _$GpsModelFromJson(Map<String, dynamic> json) {
  return GpsModel(
    id: json["id"] as int,
    alias: json["alias"] as String,
    latitude: json["latitude"] as Double,
    longitude: json["longitude"] as Double,
    orientation: json["orientation"] as Double,
    velocity: json["velocity"] as Double,
    active: json["active"] as Bool,
    geofenceRadiusKm: json["geofenceRadiusKm"] as Double?,
    geofenceLat: json["geofenceLat"] as Double?,
    geofenceLong: json["geofenceLong"] as Double?,
    geofenceActive: json["geofenceActive"] as Bool,
  );
}
