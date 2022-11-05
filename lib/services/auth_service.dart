import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:marriage_story_mobile/constants/string.dart';
import 'package:marriage_story_mobile/models/login_model.dart';
import 'package:marriage_story_mobile/models/user_model.dart';
import '../utils/storage.dart';

class AuthService {
  static Future<http.Response> authRegister(Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'name': data["name"],
        'email': data["email"],
        'password': data["password"],
        'role_name': data["role_name"],
      };

      var response = await http.post(Uri.parse(baseURLAPI + "register"),
          body: jsonEncode(dataRegister),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<LoginModel?> authLogin(Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
      };

      // print(object)

      var response = await http.post(Uri.parse(baseURLAPI + "login"),
          body: jsonEncode(dataLogin),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException("Connection Time Out"),
      );

      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body));
      } else {
        throw jsonDecode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> updateUser(Map<String, dynamic> data, int id) async {
    try {
      final token = Storage.getValue(storageToken);

      var event = <String, dynamic>{
        'gencode': data['gencode'],
      };

      var response = await http.put(
        Uri.parse(baseURLAPI + "admin/$id/update"),
        body: jsonEncode(event),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token"
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserModel?> userProfile() async {
    final token = Storage.getValue(storageToken);

    var response = await http.get(
      Uri.parse(baseURLAPI + "user"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(false);
    }
  }
}
