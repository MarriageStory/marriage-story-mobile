import 'package:get/get.dart';
import '../task.dart';

class TaskWeddingOrganizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskWeddingOrganizerController());
  }
}
