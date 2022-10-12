import 'package:get/get.dart';
import '../other.dart';

class OtherBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtherController());
  }
}
