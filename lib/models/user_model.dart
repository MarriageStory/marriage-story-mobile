// To parse required this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    Data data;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.user,
    });

    UserDataModel user;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserDataModel.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class UserDataModel {
    UserDataModel({
        required this.id,
        required this.fullname,
        required this.email,
        required this.roleId,
        required this.createdAt,
        required this.updatedAt,
        required this.role,
    });

    int id;
    String fullname;
    String email;
    int roleId;
    DateTime createdAt;
    DateTime updatedAt;
    Role role;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        roleId: json["role_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: Role.fromJson(json["role"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "role_id": roleId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role": role.toJson(),
    };
}

class Role {
    Role({
        required this.id,
        required this.roleName,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String roleName;
    DateTime createdAt;
    DateTime updatedAt;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        roleName: json["role_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "role_name": roleName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
