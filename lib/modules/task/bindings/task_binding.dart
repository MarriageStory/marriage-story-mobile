import 'package:get/get.dart';
import '../task.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskController());
  }
}
