import 'package:get/get.dart';
import '../controllers/event_client_controller.dart';

class EventClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventClientController());
  }
}
