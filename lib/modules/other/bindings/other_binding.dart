import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/home/home.dart';
import '../other.dart';

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtherController());
    Get.lazyPut(() => HomeController());
  }
}
