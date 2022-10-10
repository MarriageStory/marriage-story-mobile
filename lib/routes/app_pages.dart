import 'package:get/get.dart';
import '../modules/auth/auth.dart';
import '../modules/role/role.dart';
import '../modules/splash/splash.dart';
import '../modules/landing/landing.dart';

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
  ];
}
