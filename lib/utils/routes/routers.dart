import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/view/profile/account-management/change_password_screen.dart';
import 'package:sheba_plus/view/profile/notification/notification_details_screen.dart';
import 'package:sheba_plus/view/cart/cart_details_screen.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_order_info_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/forget_password_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/reset_password_email_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/reset_password_email_verification_screen.dart';
import 'package:sheba_plus/view/auth/forget-password/set_new_password_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/email_verification_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/referral_screen/referral_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/register-address/register_adress_screen.dart';
import 'package:sheba_plus/view/auth/register_screen/register_screen.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/sign_in_screen.dart';
import 'package:sheba_plus/view/cart/cart_details_screen.dart';
import 'package:sheba_plus/view/display_center/screen/display_center_product_details_screen.dart';
import 'package:sheba_plus/view/display_center/screen/display_center_product_list_screen.dart';
import 'package:sheba_plus/view/home/home_screen.dart';
import 'package:sheba_plus/view/profile/notification/notification_details_screen.dart';
import 'package:sheba_plus/view/profile/profile_screen.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_order_info_screen.dart';
import 'package:sheba_plus/view/services/partial_checkout_screen.dart';
import 'package:sheba_plus/view/splash_screen.dart';
import 'package:sheba_plus/view/third_party/third_party_shop_and_item_details_screen.dart';

import 'routes.dart';

class AppRouters {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
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
      name: Routes.changePassword,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.agentShoppingOrderInfoScreen,
      page: () => AgentShoppingOrderInfoScreen(),
    ),
    GetPage(
      name: Routes.displayCenterServiceProductListScreen,
      page: () => const DisplayCenterProductListScreen(),
    ),
    GetPage(
      name: Routes.partialCheckoutScreen,
      page: () => PartialCheckoutScreen(),
    ),
    GetPage(
      name: Routes.notificationDetails,
      page: () {
        final notification = Get.arguments as UserNotification;
        return NotificationDetailsScreen(notification: notification);
      },
    ),
    GetPage(
      name: Routes.displayCenterServiceProductDetailsScreen,
      page: () {
        DisplayCenterProductDetailsScreen displayCenterProductDetailsScreen =
            Get.arguments;
        return displayCenterProductDetailsScreen;
      },
    ),
    GetPage(
      name: Routes.cartDetailsScreen,
      page: () => CartDetailsScreen(),
    ),
    GetPage(
      name: Routes.thirdPartyShopAndItemDetailsScreen,
      page: () => ThirdPartyShopAndItemDetailsScreen(),
    ),
  ];
}
