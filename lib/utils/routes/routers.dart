import 'package:get/get.dart';
import 'package:sheba_plus/middlewares/auth_middleware.dart';
import 'package:sheba_plus/view/auth/register_screen/register_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/sign_in_screen.dart';
import 'package:sheba_plus/view/home/home_screen.dart';
import 'package:sheba_plus/view/main/main_screen.dart';
import 'package:sheba_plus/view/profile/profile_screen.dart';
import 'package:sheba_plus/view/splash_screen.dart';
import 'routes.dart';

class AppRouters {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.main,
      page: () => MainScreen(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
    ),
  ];
}
