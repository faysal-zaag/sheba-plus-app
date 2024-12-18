import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_body.freezed.dart';
part 'notification_body.g.dart';

@freezed
class NotificationBody with _$NotificationBody {
  const factory NotificationBody({
    @Default('') String agentPurchaseHour,
    @Default('') String shoppingArea,
    @Default('') String meetingTime,
    @Default('') String ticketNumber,
    @Default('') String message,
  }) = _NotificationBody;

  factory NotificationBody.fromJson(Map<String, dynamic> json) => _$NotificationBodyFromJson(json);
}
