import 'package:get/get.dart';
import '../task.dart';

class DetailTaskClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailTaskClientController());
  }
}
