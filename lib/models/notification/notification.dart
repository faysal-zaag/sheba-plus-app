import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class UserNotification with _$UserNotification {
  const factory UserNotification({
    @Default(0) int id,
    @Default("") String title,
    @Default("") String details,
    @Default(false) bool readStats,
    String? ticketNo,
    int? dataId,
    String? dataTable,
    String? notificationType,
  }) = _UserNotification;

  factory UserNotification.fromJson(Map<String, dynamic> json) => _$UserNotificationFromJson(json);
}
