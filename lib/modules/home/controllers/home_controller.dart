import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';
import 'package:marriage_story_mobile/services/event_service.dart';

import '../../../models/event_model.dart';
import '../../../models/schedule_model.dart';
import '../../../models/user_model.dart';
import '../../../services/schedule_service.dart';
import '../../../utils/storage.dart';

class HomeController extends GetxController {
  final genCodeTextController = TextEditingController();

  final user = UserModel(
    id: 0,
    name: "",
    email: "",
    emailVerifiedAt: DateTime.now(),
    roleName: "",
    gencode: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ).obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    getUserProfile();
    // getAllSchedule();

    super.onInit();
  }

  Future<void> getUserProfile() async {
    isLoading.value = true;
    try {
      final data = await AuthService.userProfile();

      user.update((val) {
        val!.id = data!.id;
        val.name = data.name;
        val.email = data.email;
        val.roleName = data.roleName;
        val.gencode = data.gencode;
      });
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }


  Future<void> getAllSchedule() async {
    try {
      final dataSchedule = await ScheduleService.getSchedules();
      if (dataSchedule != null) {
        // schedule.assignAll(dataSchedule);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateGenCode() async {
    var input = <String, dynamic>{
      'gencode': genCodeTextController.text,
    };
    try {
      var updateCode = await AuthService.updateUser(input, user.value.id);

      Get.snackbar(
        'Berhasil Menemukan Event !',
        'Event dengan Code ${user.value.gencode}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Gagal Menemukan Event',
        '',
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
