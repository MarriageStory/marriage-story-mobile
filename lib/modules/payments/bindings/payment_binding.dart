import 'package:get/get.dart';
import '../payment.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
  }
}
