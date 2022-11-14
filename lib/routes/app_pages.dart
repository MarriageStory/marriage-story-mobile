import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/auth/views/register_view.dart';
import '../modules/navigation/navigation.dart';
import '../modules/auth/auth.dart';
import '../modules/splash/splash.dart';
import '../modules/landing/landing.dart';
import '../modules/home/home.dart';
import '../modules/events/event.dart';
import '../modules/payments/payment.dart';
import '../modules/other/other.dart';
import '../modules/task/task.dart';

part './app_routes.dart';

class AppPages {
  static const initial = RouteName.splash;

  static final pages = [
    //Welcome Page
    GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.navigation,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: RouteName.landing,
      page: () => LandingScreen(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),

    GetPage(
      name: RouteName.detailEvent,
      page: () => DetailEventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: RouteName.addEvent,
      page: () => AddEventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: RouteName.task,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: RouteName.detailTask,
      page: () => DetailTaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: RouteName.addTask,
      page: () => AddTaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: RouteName.detailPayment,
      page: () => DetailPaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: RouteName.transaction,
      page: () => TransactionView(),
      binding: PaymentBinding(),
    ),

  ];
}
