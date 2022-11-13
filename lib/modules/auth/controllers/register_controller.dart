import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';
import '../../../constants/string.dart';
import '../../../routes/routes.dart';
import '../../../utils/storage.dart';

class RegisterController extends GetxController {
  final authSerivice = Get.put(AuthService());
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final isObsecured = true.obs;

  @override
  void onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    final input = <String, dynamic>{
      'fullname': nameTextController.text,
      'email': emailTextController.text,
      'password': passwordTextController.text,
      'role_id': "1",
    };

    try {
      var registerResponse = await authSerivice.authRegister(input);
      await Storage.saveValue(storageToken, registerResponse?.payload.token);

      Get.snackbar(
        'Berhasil Mendaftar !',
        'Selamat Datang ${registerResponse?.user.fullname}',
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
        'Gagal Mendaftar !',
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
