// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_meeting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentMeetingImpl _$$AgentMeetingImplFromJson(Map<String, dynamic> json) =>
    _$AgentMeetingImpl(
      createdAt: json['createdAt'] as num? ?? 0,
      id: json['id'] as num? ?? 0,
      meetingLocations: (json['meetingLocations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      meetingTime: json['meetingTime'] as num? ?? 0,
      meetingEndTime: json['meetingEndTime'] as num? ?? 0,
      estimatedBudget: json['estimatedBudget'] as num? ?? 0,
      estimatedBudgetInBdt: json['estimatedBudgetInBdt'] as num? ?? 0,
      hourBooked: json['hourBooked'] as num? ?? 0,
      agent: json['agent'] == null
          ? const User()
          : User.fromJson(json['agent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AgentMeetingImplToJson(_$AgentMeetingImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'meetingLocations': instance.meetingLocations,
      'meetingTime': instance.meetingTime,
      'meetingEndTime': instance.meetingEndTime,
      'estimatedBudget': instance.estimatedBudget,
      'estimatedBudgetInBdt': instance.estimatedBudgetInBdt,
      'hourBooked': instance.hourBooked,
      'agent': instance.agent,
    };
