// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceImpl _$$InvoiceImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceImpl(
      agentFee: json['agentFee'] as num? ?? 0,
      shoppingCost: json['shoppingCost'] as num? ?? 0,
      shippingCost: json['shippingCost'] as num? ?? 0,
      dropOffCost: json['dropOffCost'] as num? ?? 0,
      totalVat: json['totalVat'] as num? ?? 0,
      totalTax: json['totalTax'] as num? ?? 0,
      totalProduct: json['totalProduct'] as num? ?? 0,
      totalProductPrice: json['totalProductPrice'] as num? ?? 0,
      totalAppliedPoint: json['totalAppliedPoint'] as num? ?? 0,
      totalAppliedPointAmount: json['totalAppliedPointAmount'] as num? ?? 0,
      totalPrice: json['totalPrice'] as num? ?? 0,
      promoDiscount: json['promoDiscount'] as num? ?? 0,
      paidAmount: json['paidAmount'] as num? ?? 0,
      finalPrice: json['finalPrice'] as num? ?? 0,
      exactFinalPrice: json['exactFinalPrice'] as num? ?? 0,
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
      'promoDiscount': instance.promoDiscount,
      'paidAmount': instance.paidAmount,
      'finalPrice': instance.finalPrice,
      'exactFinalPrice': instance.exactFinalPrice,
    };
