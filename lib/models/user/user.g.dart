// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      email: json['email'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      profilePicture: json['profilePicture'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      countryCode: json['countryCode'] as String?,
      dateOfBirth: (json['dateOfBirth'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePicture': instance.profilePicture,
      'mobileNumber': instance.mobileNumber,
      'countryCode': instance.countryCode,
      'dateOfBirth': instance.dateOfBirth,
    };
