import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/events/event.dart';
import 'package:marriage_story_mobile/modules/home/home.dart';
import 'package:marriage_story_mobile/modules/other/other.dart';
import 'package:marriage_story_mobile/modules/payments/payments.dart';
import '../controllers/navigation_client_controller.dart';

class NavigationClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationClientController());
    Get.lazyPut<HomeClientController>(() => HomeClientController(),
        fenix: true);
    Get.lazyPut<EventClientController>(() => EventClientController(),
        fenix: true);
    Get.lazyPut<PaymentClientController>(() => PaymentClientController(),
        fenix: true);
    Get.lazyPut<OtherController>(() => OtherController(), fenix: true);
  }
}
