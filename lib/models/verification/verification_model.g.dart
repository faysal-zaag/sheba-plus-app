// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationModelImpl _$$VerificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationModelImpl(
      code: (json['code'] as num).toInt(),
      email: json['email'] as String,
    );

Map<String, dynamic> _$$VerificationModelImplToJson(
        _$VerificationModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'email': instance.email,
    };
