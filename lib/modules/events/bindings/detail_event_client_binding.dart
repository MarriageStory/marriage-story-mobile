import 'package:get/get.dart';
import '../event.dart';

class DetailEventClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailEventClientController());
  }
}
