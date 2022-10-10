import 'package:get/get.dart';
import '../controllers/home_client_controller.dart';

class HomeClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeClientController());
  }
}
