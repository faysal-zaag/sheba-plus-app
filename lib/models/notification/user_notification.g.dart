// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserNotificationImpl _$$UserNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? "",
      details: json['details'] as String? ?? "",
      readStats: json['readStats'] as bool? ?? false,
      ticketNo: json['ticketNo'] as String?,
      body: json['body'] == null
          ? null
          : NotificationBody.fromJson(json['body'] as Map<String, dynamic>),
      dataId: (json['dataId'] as num?)?.toInt(),
      dataTable: json['dataTable'] as String?,
      notificationType: json['notificationType'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserNotificationImplToJson(
        _$UserNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'details': instance.details,
      'readStats': instance.readStats,
      'ticketNo': instance.ticketNo,
      'body': instance.body,
      'dataId': instance.dataId,
      'dataTable': instance.dataTable,
      'notificationType': instance.notificationType,
      'user': instance.user,
    };
