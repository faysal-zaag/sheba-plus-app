// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      invoiceNumber: json['invoiceNumber'] as String? ?? "",
      status: json['status'] as String? ?? "",
      dropOffService: json['dropOffService'] as bool? ?? false,
      customerAchievedPoint: json['customerAchievedPoint'] as num? ?? 0,
      currentCadRate: json['currentCadRate'] as num? ?? 0,
      paid: json['paid'] as bool? ?? false,
      hourBooked: json['hourBooked'] as num? ?? 0,
      invoice: json['invoice'] == null
          ? const Invoice()
          : Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      dropOffAddress: json['dropOffAddress'] == null
          ? const Address()
          : Address.fromJson(json['dropOffAddress'] as Map<String, dynamic>),
      shoppingDetailsList: (json['shoppingDetailsList'] as List<dynamic>?)
              ?.map((e) => ShoppingDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'invoiceNumber': instance.invoiceNumber,
      'status': instance.status,
      'dropOffService': instance.dropOffService,
      'customerAchievedPoint': instance.customerAchievedPoint,
      'currentCadRate': instance.currentCadRate,
      'paid': instance.paid,
      'hourBooked': instance.hourBooked,
      'invoice': instance.invoice,
      'dropOffAddress': instance.dropOffAddress,
      'shoppingDetailsList': instance.shoppingDetailsList,
    };
