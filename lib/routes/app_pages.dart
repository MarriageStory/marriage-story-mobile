import 'package:get/get.dart';
import '../modules/navigation/navigation.dart';
import '../modules/auth/auth.dart';
import '../modules/role/role.dart';
import '../modules/splash/splash.dart';
import '../modules/landing/landing.dart';
import '../modules/home/home.dart';
import '../modules/events/event.dart';
import '../modules/payments/payments.dart';
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
      name: RouteName.role,
      page: () => RoleScreen(),
      binding: RoleBinding(),
    ),
    GetPage(
      name: RouteName.landing,
      page: () => LandingScreen(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: RouteName.other,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: RouteName.eventClient,
      page: () => EventClientView(),
      binding: EventClientBinding(),
    ),
    GetPage(
      name: RouteName.detailEventClient,
      page: () => DetailEventClientView(),
      binding: EventClientBinding(),
    ),
    GetPage(
      name: RouteName.detailTaskClient,
      page: () => DetailTaskClientView(),
      binding: DetailTaskClientBinding(),
    ),
    GetPage(
      name: RouteName.paymentClient,
      page: () => PaymentClientView(),
      binding: PaymentClientBinding(),
    ),

    // Wedding Organizer Page
    GetPage(
      name: RouteName.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.eventWeddingOrganizer,
      page: () => EventWeddingOrganizerView(),
      binding: EventWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.detailEventWeddingOrganizer,
      page: () => DetailEventWeddingOrganizerView(),
      binding: EventWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.addEventWeddingOrganizer1,
      page: () => AddEvent1View(),
      binding: EventWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.addEventWeddingOrganizer2,
      page: () => AddEvent2View(),
      binding: EventWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.addEventWeddingOrganizer3,
      page: () => AddEvent3View(),
      binding: EventWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.taskWo,
      page: () => TaskWeddingOrganizerView(),
      binding: TaskWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.paymentWo,
      page: () => PaymentWeddingOrganizerView(),
      binding: PaymentWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.detailPaymentWo,
      page: () => DetailPaymentWeddingOrganizerView(),
      binding: PaymentWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.detailTransactionWo,
      page: () => DetailTransactionWeddingOrganizerView(),
      binding: PaymentWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.addTaskWo,
      page: () => AddTaskWeddingOrganizerView(),
      binding: TaskWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.detailTaskWo,
      page: () => DetailTaskWeddingOrganizerView(),
      binding: TaskWeddingOrganizerBinding(),
    ),
    GetPage(
      name: RouteName.detailTransactionClient,
      page: () => DetailTransactionClientView(),
      binding: PaymentClientBinding(),
    ),
    GetPage(
      name: RouteName.addTransactionClient,
      page: () => AddTransactionClientView(),
      binding: PaymentClientBinding(),
    ),
  ];
}
