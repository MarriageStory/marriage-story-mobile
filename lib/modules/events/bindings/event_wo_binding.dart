import 'package:get/get.dart';
import '../controllers/event_wo_controller.dart';

class EventWeddingOrganizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventWeddingOrganizerController());
  }
}
