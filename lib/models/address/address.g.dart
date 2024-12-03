// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? 'Unknown',
      country: json['country'] as String? ?? 'Unknown',
      city: json['city'] as String? ?? 'Unknown',
      state: json['state'] as String? ?? 'Unknown',
      street: json['street'] as String? ?? 'Unknown',
      streetAlternative: json['streetAlternative'] as String?,
      countryCode: json['countryCode'] as String?,
      addressDesc: json['addressDesc'] as String?,
      zipCode: (json['zipCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'streetAlternative': instance.streetAlternative,
      'countryCode': instance.countryCode,
      'addressDesc': instance.addressDesc,
      'zipCode': instance.zipCode,
    };
