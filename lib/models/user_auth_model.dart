// To parse required this JSON data, do
//
//     final userAuthModel = userAuthModelFromJson(jsonString);

import 'dart:convert';

UserAuthModel userAuthModelFromJson(String str) => UserAuthModel.fromJson(json.decode(str));

String userAuthModelToJson(UserAuthModel data) => json.encode(data.toJson());

class UserAuthModel {
    UserAuthModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    UserAuthDataModel data;

    factory UserAuthModel.fromJson(Map<String, dynamic> json) => UserAuthModel(
        status: json["status"],
        message: json["message"],
        data: UserAuthDataModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class UserAuthDataModel {
    UserAuthDataModel({
        required this.user,
        required this.payload,
    });

    User user;
    Payload payload;

    factory UserAuthDataModel.fromJson(Map<String, dynamic> json) => UserAuthDataModel(
        user: User.fromJson(json["user"]),
        payload: Payload.fromJson(json["payload"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "payload": payload.toJson(),
    };
}

class Payload {
    Payload({
        required this.type,
        required this.token,
    });

    String type;
    String token;

    factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        type: json["type"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "token": token,
    };
}

class User {
    User({
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

    factory User.fromJson(Map<String, dynamic> json) => User(
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
