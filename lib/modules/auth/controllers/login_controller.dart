import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/utils/storage.dart';
import 'package:marriage_story_mobile/routes/routes.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';

class LoginController extends GetxController {
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
      isLoading = true;

      var loginResponse = await AuthService.authLogin(input);

      Storage.saveValue('token', loginResponse?.accessToken);

      var user = await AuthService.userProfile();

      if (user!.roleName == "Client") {
        Get.snackbar(
          'Berhasil Masuk !',
          'Selamat Datang ',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
        Get.offAllNamed(RouteName.navigationClient);
      } else if (user!.roleName == "WeddingOrganize") {
        Get.snackbar(
          'Berhasil Masuk !',
          'Selamat Datang ',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
        Get.offAllNamed(RouteName.navigationWo);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      print(e);
    }
  }
}
