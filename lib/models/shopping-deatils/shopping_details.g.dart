// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingDetailsImpl _$$ShoppingDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingDetailsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      shopName: json['shopName'] as String? ?? "",
      taxAmount: (json['taxAmount'] as num?)?.toInt() ?? 0,
      vat: (json['vat'] as num?)?.toInt() ?? 0,
      totalItems: (json['totalItems'] as num?)?.toInt() ?? 0,
      totalItemPrice: (json['totalItemPrice'] as num?)?.toInt() ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
      alreadyPaid: (json['alreadyPaid'] as num?)?.toInt(),
      shoppingItemDetailsList:
          (json['shoppingItemDetailsList'] as List<dynamic>?)
                  ?.map((e) =>
                      ShoppingItemDetails.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$ShoppingDetailsImplToJson(
        _$ShoppingDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopName': instance.shopName,
      'taxAmount': instance.taxAmount,
      'vat': instance.vat,
      'totalItems': instance.totalItems,
      'totalItemPrice': instance.totalItemPrice,
      'totalPrice': instance.totalPrice,
      'alreadyPaid': instance.alreadyPaid,
      'shoppingItemDetailsList': instance.shoppingItemDetailsList,
    };

_$ShoppingItemDetailsImpl _$$ShoppingItemDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ShoppingItemDetailsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      totalPrice: (json['totalPrice'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ShoppingItemDetailsImplToJson(
        _$ShoppingItemDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
    };
