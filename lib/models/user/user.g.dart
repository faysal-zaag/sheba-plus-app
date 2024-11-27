// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      email: json['email'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      profilePicture: json['profilePicture'] as String?,
      mobileNumber: (json['mobileNumber'] as num?)?.toInt(),
      countryCode: json['countryCode'] as String?,
      dateOfBirth: json['dateOfBirth'] as num?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePicture': instance.profilePicture,
      'mobileNumber': instance.mobileNumber,
      'countryCode': instance.countryCode,
      'dateOfBirth': instance.dateOfBirth,
    };
