import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/auth_service.dart';

import '../../../models/user_model.dart';

class HomeWeddingOrganizerController extends GetxController {
  final user = UserModel(
          id: 0,
          name: "",
          email: "",
          emailVerifiedAt: DateTime.now(),
          roleName: "",
          gencode: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .obs;

  @override
  void onInit() {
    getUserProfile();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    try {
      var data = await AuthService.userProfile();

      print("ngent");

      user.update((val) {
        val = data;
      });
    } catch (e) {
      print(e);
    }
  }
}
