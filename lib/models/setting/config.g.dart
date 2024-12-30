// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigImpl _$$ConfigImplFromJson(Map<String, dynamic> json) => _$ConfigImpl(
      createdAt: json['createdAt'] as num? ?? 0,
      updatedAt: json['updatedAt'] as num? ?? 0,
      id: json['id'] as num? ?? 0,
      maxBudget: json['maxBudget'] as num? ?? 0,
      hourlyRates: json['hourlyRates'] as num? ?? 0,
      tax: json['tax'] as num? ?? 0,
      vat: json['vat'] as num? ?? 0,
      currency: json['currency'] as String? ?? 'CAD',
      currencyConversionRate: json['currencyConversionRate'] as num? ?? 1,
      agentTransportationFee: json['agentTransportationFee'] as num? ?? 0,
      dropOffCharge: json['dropOffCharge'] as num? ?? 0,
      referralPoint: json['referralPoint'] as num? ?? 0,
      referralPointConversionRate:
          json['referralPointConversionRate'] as num? ?? 0,
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
      'agentTransportationFee': instance.agentTransportationFee,
      'dropOffCharge': instance.dropOffCharge,
      'referralPoint': instance.referralPoint,
      'referralPointConversionRate': instance.referralPointConversionRate,
    };
