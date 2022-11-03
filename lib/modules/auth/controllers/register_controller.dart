import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';
import '../../../constants/string.dart';
import '../../../routes/routes.dart';
import '../../../utils/storage.dart';

class RegisterController extends GetxController {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final isObsecured = true.obs;

  @override
  void onInit() {
    print(Storage.getValue(storageToken));
    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    final input = <String, dynamic>{
      'name': nameTextController.text,
      'email': emailTextController.text,
      'password': passwordTextController.text,
      'role_name': "Client",
    };

    var registerResponse = await AuthService.authRegister(input);

    if (registerResponse.statusCode == 200) {
      Map<String, dynamic> token = jsonDecode(registerResponse.body);
      Storage.saveValue('token', token['data']);
      Get.snackbar(
        'Berhasil Mendaftar !',
        'Selamat Datang ${token['data']['name']}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RouteName.navigation);
    } else {
      Map<String, dynamic> error = jsonDecode(registerResponse.body);
      Get.snackbar(
        'Gagal Mendaftar !',
        '${error['data']}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }
}
