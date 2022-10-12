import 'package:get/get.dart';
import '../home.dart';

class HomeClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeClientController());
    Get.put(HomeClientEmpty());
  }
}
