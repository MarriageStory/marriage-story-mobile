import 'package:get/get.dart';
import '../controllers/home_wo_controller.dart';

class HomeWeddingOrganizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeWeddingOrganizerController());
  }
}
