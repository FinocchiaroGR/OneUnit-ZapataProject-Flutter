class CarModel {
  int? id;
  int? idGPS;
  String? brandName;
  String? modelName;
  int? modelYear;
  String? image;
  String? description;
  int? geofenceRadius;
  int? velocityLimit;
  String? insurancePolicyValidity;
  String? verificationValidity;
  String? circulationCardValidity;

  CarModel({
    this.id,
    this.idGPS,
    this.brandName,
    this.modelName,
    this.modelYear,
    this.image,
    this.description,
    this.geofenceRadius,
    this.velocityLimit,
    this.insurancePolicyValidity,
    this.verificationValidity,
    this.circulationCardValidity,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}

CarModel _$CarModelFromJson(Map<String, dynamic> json) {
  return CarModel(
    id: json["id"] as int,
    idGPS: json["gps"]["id"] as int,
    brandName: json["model"]["brand"]["name"] as String,
    modelName: json["model"]["name"] as String,
    modelYear: json["model"]["year"] as int,
    image: json["image"]["alias"] as String,
    description: json["description"] as String,
    geofenceRadius: json["geofenceRadius"] as int?,
    velocityLimit: json["velocityLimit"] as int,
    insurancePolicyValidity: json["insurancePolicyValidity"] as String?,
    verificationValidity: json["verificationValidity"] as String?,
    circulationCardValidity: json["circulationCardValidity"] as String?,
  );
}

Map<String, dynamic> _$CarModelToJson(CarModel instance) => <String, dynamic>{
      "id": instance.id,
      "idGPS": instance.idGPS,
      "brandName": instance.brandName,
      "modelName": instance.modelName,
      "modelYear": instance.modelYear,
      "image": instance.image,
      "description": instance.description,
      "geofenceRadius": instance.geofenceRadius,
      "velocityLimit": instance.velocityLimit,
      "insurancePolicyValidity": instance.insurancePolicyValidity,
      "verificationValidity": instance.verificationValidity,
      "circulationCardValidity": instance.circulationCardValidity,
    };
