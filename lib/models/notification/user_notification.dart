import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_plus/models/notification/notification_body.dart';
import 'package:sheba_plus/models/user/user.dart';

part 'user_notification.freezed.dart';
part 'user_notification.g.dart';

@freezed
class UserNotification with _$UserNotification {
  const factory UserNotification({
    @Default(0) int id,
    @Default("") String title,
    @Default("") String details,
    @Default(false) bool readStats,
    String? ticketNo,
    NotificationBody? body,
    int? dataId,
    String? dataTable,
    String? notificationType,
    User? user,
  }) = _UserNotification;

  factory UserNotification.fromJson(Map<String, dynamic> json) => _$UserNotificationFromJson(json);
}
