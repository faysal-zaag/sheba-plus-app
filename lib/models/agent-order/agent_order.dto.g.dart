// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_order.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentOrderDTOImpl _$$AgentOrderDTOImplFromJson(Map<String, dynamic> json) =>
    _$AgentOrderDTOImpl(
      meetingLocations: (json['meetingLocations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      meetingTime: json['meetingTime'] as num? ?? 0,
      estimatedBudget: json['estimatedBudget'] as num? ?? 0,
      hourBooked: json['hourBooked'] as num? ?? 0,
      deliveryAddress: json['deliveryAddress'] == null
          ? const Address()
          : Address.fromJson(json['deliveryAddress'] as Map<String, dynamic>),
      dropOffService: json['dropOffService'] as bool? ?? false,
    );

Map<String, dynamic> _$$AgentOrderDTOImplToJson(_$AgentOrderDTOImpl instance) =>
    <String, dynamic>{
      'meetingLocations': instance.meetingLocations,
      'meetingTime': instance.meetingTime,
      'estimatedBudget': instance.estimatedBudget,
      'hourBooked': instance.hourBooked,
      'deliveryAddress': instance.deliveryAddress,
      'dropOffService': instance.dropOffService,
    };
