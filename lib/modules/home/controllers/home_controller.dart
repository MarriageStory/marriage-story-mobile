import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/models/event_model.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';
import '../../../models/user_model.dart';
import '../../../services/event_service.dart';

class HomeController extends GetxController {
  final userService = Get.put(AuthService());
  final eventService = Get.put(EventService());

  final eventId = 0.obs;

  final user = UserDataModel(
    id: 0,
    fullname: "",
    email: "",
    roleId: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    role: Role(
        id: 0,
        roleName: "",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  ).obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    getUserProfile();
    // getAllUserEvent();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    isLoading.value = true;
    try {
      final userResponse = await userService.userProfile();

      user.update((val) {
        val!.id = userResponse!.id;
        val.fullname = userResponse.fullname;
        val.email = userResponse.email;
        val.roleId = userResponse.roleId;
        val.role.roleName = userResponse.role.roleName;
      });
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }

  Future<int> getEventId() async {
    try {
      final response = await eventService.getEvent();
      if (response!.isNotEmpty) {
        return response[0].id;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }
}
