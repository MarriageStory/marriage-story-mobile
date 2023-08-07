import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/utils/storage.dart';
import 'package:marriage_story_mobile/routes/routes.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';
import 'package:marriage_story_mobile/constants/string.dart';

class LoginController extends GetxController {
  final authSerivice = Get.put(AuthService());
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final isObsecured = true.obs;

  var isLoading = false;

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      var input = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
      };

      var loginResponse = await authSerivice.authLogin(input);

      await Storage.saveValue(storageToken, loginResponse!.payload.token);


      Get.snackbar(
        'Berhasil Masuk !',
        'Selamat Datang ${loginResponse.user.fullname}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RouteName.navigation);
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
        e.toString(),
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
