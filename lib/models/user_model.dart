import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.roleName,
        required this.gencode,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String roleName;
    String gencode;
    DateTime createdAt;
    DateTime updatedAt;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        roleName: json["role_name"],
        gencode: json["gencode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role_name": roleName,
        "gencode": gencode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}