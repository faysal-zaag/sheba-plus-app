// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_order.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentOrderDTOImpl _$$AgentOrderDTOImplFromJson(Map<String, dynamic> json) =>
    _$AgentOrderDTOImpl(
      meetingLocation: json['meetingLocation'] as String? ?? "",
      easternTime: (json['easternTime'] as num?)?.toInt() ?? 0,
      bdTime: (json['bdTime'] as num?)?.toInt() ?? 0,
      shoppingAmount: (json['shoppingAmount'] as num?)?.toInt() ?? 0,
      shoppingHour: (json['shoppingHour'] as num?)?.toDouble() ?? 0.0,
      agentFee: (json['agentFee'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] == null
          ? const Address()
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      dropOffService: json['dropOffService'] as bool? ?? false,
    );

Map<String, dynamic> _$$AgentOrderDTOImplToJson(_$AgentOrderDTOImpl instance) =>
    <String, dynamic>{
      'meetingLocation': instance.meetingLocation,
      'easternTime': instance.easternTime,
      'bdTime': instance.bdTime,
      'shoppingAmount': instance.shoppingAmount,
      'shoppingHour': instance.shoppingHour,
      'agentFee': instance.agentFee,
      'address': instance.address,
      'dropOffService': instance.dropOffService,
    };

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      street: json['street'] as String? ?? "",
      city: json['city'] as String? ?? "",
      state: json['state'] as String? ?? "",
      zipCode: json['zipCode'] as String? ?? "",
      country: json['country'] as String? ?? "",
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };
