import 'package:get/get.dart';
import '../modules/role/role.dart';
import '../modules/splash/splash.dart';

part './app_routes.dart';

class AppPages {
  static const initial = RouteName.splash;

  static final pages = [
    GetPage(
      name: RouteName.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteName.role,
      page: () => RoleScreen(),
      binding: RoleBinding(),
    ),
  ];
}
