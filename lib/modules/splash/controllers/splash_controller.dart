import 'package:get/get.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/utils/storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    Storage.hasData('token')
        ? Get.offAllNamed(RouteName.navigation)
        : Get.offAllNamed(RouteName.landing);
  }
}
