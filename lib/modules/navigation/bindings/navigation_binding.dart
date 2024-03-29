import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/navigation/controllers/navigation_controller.dart';
import '../../task/task.dart';
import 'package:marriage_story_mobile/modules/events/event.dart';
import 'package:marriage_story_mobile/modules/home/home.dart';
import 'package:marriage_story_mobile/modules/other/other.dart';
import 'package:marriage_story_mobile/modules/payments/payment.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<EventController>(
        () => EventController(),
        fenix: true);
    Get.lazyPut<PaymentController>(
        () => PaymentController(),
        fenix: true);
    Get.lazyPut<OtherController>(() => OtherController(), fenix: true);
    Get.lazyPut<TaskController>(() => TaskController(), fenix: true);
  }
}
