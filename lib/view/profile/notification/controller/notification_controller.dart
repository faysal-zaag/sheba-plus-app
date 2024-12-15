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
  final getMoreNotificationsLoading = false.obs;
  final markAsReadLoading = false.obs;
  final markAllAsReadLoading = false.obs;

  final notifications = <UserNotification>[].obs;
  final unReadNotifications = 0.obs;

  Future<void> getNotifications({bool? readStatus, int page = 0}) async {
    try {
      // Set loading states based on the page
      if (page == 0) {
        getNotificationsLoading(true);
      } else {
        getMoreNotificationsLoading(true);
      }

      // Fetch notifications from the repository
      final response = await _notificationRepository.readAllNotification(readStatus: readStatus, page: page);
      final notificationListData = response.data["content"] as List;

      // Parse notifications and update unread count
      final newNotifications = notificationListData.map((notification) {
        final userNotification = UserNotification.fromJson(notification);
        if (!userNotification.readStats) {
          unReadNotifications.value++;
        }
        return userNotification;
      }).toList();

      // Update notifications list based on page
      if (page == 0) {
        notifications(newNotifications);
      } else {
        notifications.addAll(newNotifications);
      }
    } catch (err) {
      Log.error(err.toString());
    } finally {
      // Reset loading states
      getNotificationsLoading(false);
      getMoreNotificationsLoading(false);
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
