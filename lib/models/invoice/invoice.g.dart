// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      agentFee: (json['agentFee'] as num?)?.toInt() ?? 0,
      shoppingCost: (json['shoppingCost'] as num?)?.toInt() ?? 0,
      shippingCost: (json['shippingCost'] as num?)?.toInt() ?? 0,
      dropOffCost: (json['dropOffCost'] as num?)?.toInt() ?? 0,
      totalVat: (json['totalVat'] as num?)?.toInt() ?? 0,
      totalTax: (json['totalTax'] as num?)?.toInt() ?? 0,
      totalProduct: (json['totalProduct'] as num?)?.toInt() ?? 0,
      totalProductPrice: (json['totalProductPrice'] as num?)?.toInt() ?? 0,
      totalAppliedPoint: (json['totalAppliedPoint'] as num?)?.toInt() ?? 0,
      totalAppliedPointAmount:
          (json['totalAppliedPointAmount'] as num?)?.toInt() ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
      paidAmount: (json['paidAmount'] as num?)?.toInt() ?? 0,
      finalPrice: (json['finalPrice'] as num?)?.toInt() ?? 0,
      exactFinalPrice: (json['exactFinalPrice'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$InvoiceImplToJson(_$InvoiceImpl instance) =>
    <String, dynamic>{
      'agentFee': instance.agentFee,
      'shoppingCost': instance.shoppingCost,
      'shippingCost': instance.shippingCost,
      'dropOffCost': instance.dropOffCost,
      'totalVat': instance.totalVat,
      'totalTax': instance.totalTax,
      'totalProduct': instance.totalProduct,
      'totalProductPrice': instance.totalProductPrice,
      'totalAppliedPoint': instance.totalAppliedPoint,
      'totalAppliedPointAmount': instance.totalAppliedPointAmount,
      'totalPrice': instance.totalPrice,
      'paidAmount': instance.paidAmount,
      'finalPrice': instance.finalPrice,
      'exactFinalPrice': instance.exactFinalPrice,
    };
