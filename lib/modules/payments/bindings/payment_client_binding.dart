import 'package:get/get.dart';
import '../payments.dart';

class PaymentClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentClientController());
  }
}
