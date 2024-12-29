// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RedeemPointImpl _$$RedeemPointImplFromJson(Map<String, dynamic> json) =>
    _$RedeemPointImpl(
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      redeemPointAction: json['redeemPointAction'] as String? ?? "",
      redeemedBy: json['redeemedBy'] as String? ?? "",
      invoiceNumber: json['invoiceNumber'] as String?,
      point: (json['point'] as num?)?.toInt() ?? 0,
      customer: json['customer'] == null
          ? const User()
          : User.fromJson(json['customer'] as Map<String, dynamic>),
      referredBy: json['referredBy'] == null
          ? const User()
          : User.fromJson(json['referredBy'] as Map<String, dynamic>),
      referredTo: json['referredTo'] == null
          ? const User()
          : User.fromJson(json['referredTo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RedeemPointImplToJson(_$RedeemPointImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'redeemPointAction': instance.redeemPointAction,
      'redeemedBy': instance.redeemedBy,
      'invoiceNumber': instance.invoiceNumber,
      'point': instance.point,
      'customer': instance.customer,
      'referredBy': instance.referredBy,
      'referredTo': instance.referredTo,
    };
