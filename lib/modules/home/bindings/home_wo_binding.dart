import 'package:get/get.dart';
import '../home.dart';

class HomeWeddingOrganizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeWeddingOrganizerController());
  }
}
