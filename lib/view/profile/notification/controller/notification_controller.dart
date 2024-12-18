import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/notification/user_notification.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view_model/repositories/notification.repository.dart';

enum AgentOrderNotificationType {
  PURCHASE_AGENT_SERVICE,
  AGENT_SERVICE_INVALID,
  AGENT_SERVICE_UPDATED,
  TIME_LEFT,
  MEETING_STARTED,
  MEETING_EXTENDED,
  AGENT_SHOPPING_COMPLETED,
  SHOPPING_ITEM_DETAILS,
  TRANSACTION_COMPLETED,
  ORDER_STATUS,
  ORDER_DELIVERED,
  COMMON_USER_NOTIFICATION,
}

class NotificationController extends GetxController {
  final NotificationRepository _notificationRepository;

  NotificationController(this._notificationRepository);

  final selectedNotificationHistoryType = ProfileScreenTexts.all.obs;
  final expandedNotifications = <int>[].obs;

  final getNotificationsLoading = false.obs;
  final getMoreNotificationsLoading = false.obs;
  final markAsReadLoading = false.obs;
  final getSingleNotificationDetailsLoading = false.obs;
  final getLatestNotificationLoading = false.obs;
  final markAllAsReadLoading = false.obs;
  final notificationAlreadyLoaded = false.obs;

  final notifications = <UserNotification>[].obs;
  final unReadNotifications = 0.obs;
  final latestNotification = const UserNotification().obs;

  // reschedule meeting controllers
  final rescheduledMeetingLocationController = TextEditingController().obs;
  final rescheduledEasternTimeController = TextEditingController().obs;
  final rescheduledEasternTime = 0.obs;
  final rescheduledBDTimeController = TextEditingController().obs;
  final rescheduledBDTime = 0.obs;
  final rescheduledUtcTime = 0.obs;

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

      unReadNotifications(0);

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
      notificationAlreadyLoaded(true);
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

  Future<void> getLatestNotification({required int dataId}) async {
    try {
      getLatestNotificationLoading(true);

      final response = await _notificationRepository.getLatestNotification(dataId: dataId);

      UserNotification? notification = UserNotification.fromJson(response.data);
      latestNotification(notification);
    } catch (err) {
      Log.error(err.toString());
      latestNotification(const UserNotification());
    } finally {
      getLatestNotificationLoading(false);
    }
  }

  Future<void> getSingleNotificationDetails({required int id}) async {
    try {
      getSingleNotificationDetailsLoading(true);

      final response = await _notificationRepository.getSingleNotification(id: id);

      UserNotification? notification = UserNotification.fromJson(response.data);
      latestNotification(notification);
    } catch (err) {
      Log.error(err.toString());
      latestNotification(const UserNotification());
    } finally {
      getSingleNotificationDetailsLoading(false);
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

  String headerFooter({required UserNotification notification, required String body}){
    return "Hi ${notification.user?.firstName}, $body \n\nRegards,\nDS.ComTeam";
  }

  String commonMessage({required UserNotification notification}) {
    return "\n\nYou have purchased ${notification.body?.agentPurchaseHour} Hours AGENT SERVICE to assist you for shopping at ${notification.body?.shoppingArea}. "
        "Your shopping time will start on "
        "${DateFormatters.getFormattedDateTimeInCanada2(selectedDateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(notification.body?.meetingTime ?? "0")))} (ET time) "
        "OR "
        "${DateFormatters.getFormattedDateTimeInBD2(selectedDateTime: DateTime.fromMillisecondsSinceEpoch(int.parse(notification.body?.meetingTime ?? "0")))} (BD time)."
        "\n\nA Count-Down Clock (i.e., CDC) and Video Communication System (i.e., VCS) have already been installed at your track ticket details page, the CDC will guide about your time."
        "\n\nRETURN & You will get a Notification as well as Alarming Signal on CDC when your time will be running out. "
        "You can extend your shopping time then or it will terminate by itself. At any point, you can terminate your shopping by CLICKING STOP."
        "\n\nHope you enjoy your shopping with our AGENT.";
  }

  String getPurchaseAgentServiceNotificationMessage({required UserNotification notification}) {
    return headerFooter(notification: notification, body: commonMessage(notification: notification));
  }

  String getInvalidNotificationMessage({required UserNotification notification}) {
    return headerFooter(notification: notification, body: "\n\nThe shopping hours that you chose is INVALID ${notification.body?.message}");
  }

  String getAgentServiceUpdatedNotificationMessage({required UserNotification notification}) {
    return headerFooter(notification: notification, body: "\n\nYour AGENT SERVICE meeting schedule has been updated successfully. ${commonMessage(notification: notification)}") ;
  }
}
