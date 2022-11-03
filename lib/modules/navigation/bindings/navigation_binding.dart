import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/navigation/controllers/navigation_controller.dart';
import '../navigation.dart';
import 'package:marriage_story_mobile/modules/events/event.dart';
import 'package:marriage_story_mobile/modules/home/home.dart';
import 'package:marriage_story_mobile/modules/other/other.dart';
import 'package:marriage_story_mobile/modules/payments/payments.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<EventWeddingOrganizerController>(
        () => EventWeddingOrganizerController(),
        fenix: true);
    Get.lazyPut<PaymentWeddingOrganizerController>(
        () => PaymentWeddingOrganizerController(),
        fenix: true);
    Get.lazyPut<OtherController>(() => OtherController(), fenix: true);
  }
}
