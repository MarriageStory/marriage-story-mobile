import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/home/controllers/home_controller.dart';
import '../payment.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
    Get.lazyPut(() => HomeController());
  }
}
