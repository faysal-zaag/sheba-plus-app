import 'package:get/get.dart';
import 'package:sheba_plus/middlewares/auth_middleware.dart';
import 'package:sheba_plus/middlewares/home_middleware.dart';
import 'package:sheba_plus/view/agent-shopping/agent_shopping_order_info_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/set_new_password_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/email_verification_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/referral_screen/referral_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/register-addres/register_adress_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/register_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/forget_password_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/reset_password_email_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/sign_in_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/reset_password_email_verification_screen.dart';
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
      middlewares: [HomeMiddleware(), AuthMiddleware()]
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.registerAddress,
      page: () => const RegisterAddressScreen(),
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
      name: Routes.forgetPasswordEmail,
      page: () => const ResetPasswordEmailScreen(),
    ),
    GetPage(
      name: Routes.setNewPassword,
      page: () => const SetNewPasswordScreen(),
    ),
    GetPage(
      name: Routes.agentShoppingOrderInfoScreen,
      page: () => AgentShoppingOrderInfoScreen(),
    ),
  ];
}
