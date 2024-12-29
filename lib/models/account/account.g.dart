// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
      totalOrder: (json['totalOrder'] as num?)?.toInt() ?? 0,
      point: (json['point'] as num?)?.toInt() ?? 0,
      referralBonus: (json['referralBonus'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'id': instance.id,
      'balance': instance.balance,
      'totalSpent': instance.totalSpent,
      'totalOrder': instance.totalOrder,
      'point': instance.point,
      'referralBonus': instance.referralBonus,
    };
