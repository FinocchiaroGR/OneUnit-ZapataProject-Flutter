class UserModel {
  int? id;
  String? name;
  String? email;
  String? address;
  String? birthDate;
  String? licenceValidity;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.birthDate,
    this.licenceValidity,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json["id"] as int,
    name: json["user"]["name"] as String,
    email: json["user"]['email'] as String,
    address: json["address"] as String,
    birthDate: json["birthDate"] as String,
    licenceValidity: json["licenceValidity"] as String?,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      "id": instance.id,
      "name": instance.name,
      "email": instance.email,
      "address": instance.address,
      "birthDate": instance.birthDate,
      "licenceValidity": instance.licenceValidity,
    };
