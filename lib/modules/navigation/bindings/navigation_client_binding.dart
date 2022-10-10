import 'package:get/get.dart';
import '../controllers/navigation_client_controller.dart';

class NavigationClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationClientController());
  }
}
