// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoCodeImpl _$$PromoCodeImplFromJson(Map<String, dynamic> json) =>
    _$PromoCodeImpl(
      code: json['code'] as String? ?? "",
      validFrom: json['validFrom'] as String? ?? "",
      validTo: json['validTo'] as String? ?? "",
      discountType: json['discountType'] as String? ?? "",
      percent: (json['percent'] as num?)?.toInt() ?? 0,
      flatAmount: (json['flatAmount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PromoCodeImplToJson(_$PromoCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'validFrom': instance.validFrom,
      'validTo': instance.validTo,
      'discountType': instance.discountType,
      'percent': instance.percent,
      'flatAmount': instance.flatAmount,
    };
