// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationBodyImpl _$$NotificationBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationBodyImpl(
      agentPurchaseHour: json['agentPurchaseHour'] as String? ?? '',
      shoppingArea: json['shoppingArea'] as String? ?? '',
      meetingTime: json['meetingTime'] as String? ?? '',
      ticketNumber: json['ticketNumber'] as String? ?? '',
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$NotificationBodyImplToJson(
        _$NotificationBodyImpl instance) =>
    <String, dynamic>{
      'agentPurchaseHour': instance.agentPurchaseHour,
      'shoppingArea': instance.shoppingArea,
      'meetingTime': instance.meetingTime,
      'ticketNumber': instance.ticketNumber,
      'message': instance.message,
    };
