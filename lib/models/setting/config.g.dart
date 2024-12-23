// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigImpl _$$ConfigImplFromJson(Map<String, dynamic> json) => _$ConfigImpl(
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      updatedAt: (json['updatedAt'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      maxBudget: (json['maxBudget'] as num?)?.toInt() ?? 0,
      hourlyRates: (json['hourlyRates'] as num?)?.toInt() ?? 0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      vat: (json['vat'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'CAD',
      currencyConversionRate:
          (json['currencyConversionRate'] as num?)?.toDouble() ?? 1.0,
      dropOffCharge: (json['dropOffCharge'] as num?)?.toInt() ?? 0,
      referralPoint: (json['referralPoint'] as num?)?.toInt() ?? 0,
      referralPointConversionRate:
          (json['referralPointConversionRate'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
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
