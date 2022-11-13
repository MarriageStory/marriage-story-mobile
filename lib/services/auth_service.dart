import './base_service.dart';
import 'package:marriage_story_mobile/models/user_auth_model.dart';
import 'package:marriage_story_mobile/models/user_model.dart';

class AuthService extends BaseService {
  Future<UserAuthDataModel?> authRegister(Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'fullname': data["fullname"],
        'email': data["email"],
        'password': data["password"],
        'role_id': data["role_id"],
      };

      final response = await post("/auth/register", dataRegister);

      if (response.statusCode == 201) {
        return UserAuthDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      if (e.toString() == "Email telah terdaftar") {
        throw ("Email Telah Terdaftar!");
      } else {
        rethrow;
      }
    }
  }

  Future<UserAuthDataModel?> authLogin(Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
      };
      final response = await post("/auth/login", dataLogin);

      if (response.statusCode == 200) {
        return UserAuthDataModel.fromJson(response.body['data']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDataModel?> userUpdateProfile(Map<String, dynamic> input) async {
    try {
      var dataProfile = <String, dynamic>{
        'fullname': input['fullname'],
      };

      final response = await post("/users/profile/update", dataProfile);

      if (response.statusCode == 200) {
        return UserDataModel.fromJson(response.body['data']['user']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserDataModel?> userProfile() async {
    try {
      final response = await get("/users/profile");

      if (response.statusCode == 200) {
        return UserDataModel.fromJson(response.body['data']['user']);
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
