import 'package:get/get.dart';
import '../payments.dart';

class PaymentWeddingOrganizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentWeddingOrganizerController());
  }
}
