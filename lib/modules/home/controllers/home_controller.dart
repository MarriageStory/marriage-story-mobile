import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';

import '../../../models/user_model.dart';

class HomeController extends GetxController {
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
    super.onInit();
  }

  Future<void> getUserProfile() async {
    isLoading.value = true;
    try {
      final data = await AuthService.userProfile();

      user.update((val) {
        val!.name = data!.name;
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
}
