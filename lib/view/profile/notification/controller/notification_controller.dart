import 'package:get/get.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class NotificationController extends GetxController {
  final selectedNotificationHistoryType = ProfileScreenTexts.all.obs;
  final expandedNotifications = <int>[].obs;

  void readMoreOnTap(int index) {
    if (expandedNotifications.contains(index)) {
      expandedNotifications.remove(index);
    } else {
      expandedNotifications.add(index);
    }
  }
}
