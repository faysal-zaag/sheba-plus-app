// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      invoice: json['invoice'] == null
          ? const Invoice()
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      dropOffAddress: json['dropOffAddress'] == null
          ? const Address()
          : Address.fromJson(json['dropOffAddress'] as Map<String, dynamic>),
      shoppingDetailsList: (json['shoppingDetailsList'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice': instance.invoice,
      'dropOffAddress': instance.dropOffAddress,
      'shoppingDetailsList': instance.shoppingDetailsList,
    };
