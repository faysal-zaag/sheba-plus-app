import 'package:get/get.dart';
import 'package:sheba_plus/middlewares/auth_middleware.dart';
import 'package:sheba_plus/view/auth/register_screen/email_verification_screen.dart';
import 'package:sheba_plus/view/auth/referral_screen/referral_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/register_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/forget_password_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/new_password_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/sign_in_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/widgets/reset_password_email_verification_screen.dart';
import 'package:sheba_plus/view/home/home_screen.dart';
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
      name: Routes.home,
      page: () => HomeScreen(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: Routes.referral,
      page: () => const ReferralScreen(),
    ),
    GetPage(
      name: Routes.emailVerification,
      page: () => const EmailVerificationScreen(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.emailVerificationForResetPassword,
      page: () => const ResetPasswordEmailVerificationScreen(),
    ),
    GetPage(
      name: Routes.newPassword,
      page: () => const NewPasswordScreen(),
    ),
  ];
}
