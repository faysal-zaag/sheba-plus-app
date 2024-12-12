import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/notification.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view_model/repositories/notification.repository.dart';

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository;

  NotificationController(this._notificationRepository);

  final selectedNotificationHistoryType = ProfileScreenTexts.all.obs;
  final expandedNotifications = <int>[].obs;

  final getNotificationsLoading = false.obs;
  final markAsReadLoading = false.obs;
  final markAllAsReadLoading = false.obs;

  final notifications = <UserNotification>[].obs;
  final unReadNotifications = 0.obs;

  Future<void> getNotifications({bool? readStatus}) async {
    try {
      getNotificationsLoading(true);
      final response = await _notificationRepository.readAllNotification(readStatus: readStatus);

      var notificationListData = response.data["content"] as List;
      unReadNotifications(0);

      var notificationList = notificationListData.map((notification) {
        UserNotification userNotification = UserNotification.fromJson(notification);
        if (userNotification.readStats == false) unReadNotifications(unReadNotifications.value + 1);
        return userNotification;
      }).toList();

      notifications(notificationList);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      getNotificationsLoading(false);
    }
  }

  Future<bool> markAsRead({required int notificationId}) async {
    try {
      markAsReadLoading(true);
      await _notificationRepository.markAsRead(notificationId: notificationId);
      await getNotifications();
      return true;
    } catch (err) {
      Log.error(err.toString());
      return false;
    } finally {
      markAsReadLoading(false);
    }
  }

  Future<bool> markAllAsRead() async {
    try {
      await _notificationRepository.markAllAsRead();
      await getNotifications();
      return true;
    } catch (err) {
      Log.error(err.toString());
      return false;
    } finally {}
  }

  void readMoreOnTap(int index) {
    if (expandedNotifications.contains(index)) {
      expandedNotifications.remove(index);
    } else {
      expandedNotifications.add(index);
    }
  }
}
