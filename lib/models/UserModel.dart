class UserModel {
  int? id;
  String? nombre;
  String? correo;
  String? dir;
  String? birth;
  String? lic;

  UserModel({
    this.id,
    this.nombre,
    this.correo,
    this.dir,
    this.birth,
    this.lic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json["id"] as int,
    nombre: json["nombre"] as String,
    correo: json["correo"] as String,
    dir: json["dir"] as String,
    birth: json["birth"] as String,
    lic: json["lic"] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      "id": instance.id,
      "name": instance.nombre,
      "username": instance.correo,
      "email": instance.dir,
      "address": instance.birth,
      "phone": instance.lic,
    };
