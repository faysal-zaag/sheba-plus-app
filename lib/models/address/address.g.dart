// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      title: json['title'] as String? ?? 'Unknown',
      country: json['country'] as String? ?? 'Unknown',
      city: json['city'] as String? ?? 'Unknown',
      state: json['state'] as String? ?? 'Unknown',
      street: json['street'] as String? ?? 'Unknown',
      zipCode: (json['zipCode'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'zipCode': instance.zipCode,
    };
