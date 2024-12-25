// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_item_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopItemInfoImpl _$$ShopItemInfoImplFromJson(Map<String, dynamic> json) =>
    _$ShopItemInfoImpl(
      shopName: json['shopName'] as String? ?? "",
      shopAddress: json['shopAddress'] as String? ?? "",
      contactNumber: json['contactNumber'] as String? ?? "",
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ShopItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShopItemInfoImplToJson(_$ShopItemInfoImpl instance) =>
    <String, dynamic>{
      'shopName': instance.shopName,
      'shopAddress': instance.shopAddress,
      'contactNumber': instance.contactNumber,
      'items': instance.items,
    };

_$ShopItemImpl _$$ShopItemImplFromJson(Map<String, dynamic> json) =>
    _$ShopItemImpl(
      name: json['name'] as String? ?? "Unknown",
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ShopItemImplToJson(_$ShopItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };
