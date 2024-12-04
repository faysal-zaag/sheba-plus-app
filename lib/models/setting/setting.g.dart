// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingImpl _$$SettingImplFromJson(Map<String, dynamic> json) =>
    _$SettingImpl(
      createdAt: (json['createdAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      maxBudget: (json['maxBudget'] as num?)?.toInt(),
      hourlyRates: (json['hourlyRates'] as num?)?.toInt(),
      tax: (json['tax'] as num?)?.toDouble(),
      vat: (json['vat'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      currencyConversionRate:
          (json['currencyConversionRate'] as num?)?.toDouble(),
      dropOffCharge: (json['dropOffCharge'] as num?)?.toInt(),
      referralPoint: (json['referralPoint'] as num?)?.toInt(),
      referralPointConversionRate:
          (json['referralPointConversionRate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SettingImplToJson(_$SettingImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'maxBudget': instance.maxBudget,
      'hourlyRates': instance.hourlyRates,
      'tax': instance.tax,
      'vat': instance.vat,
      'currency': instance.currency,
      'currencyConversionRate': instance.currencyConversionRate,
      'dropOffCharge': instance.dropOffCharge,
      'referralPoint': instance.referralPoint,
      'referralPointConversionRate': instance.referralPointConversionRate,
    };
