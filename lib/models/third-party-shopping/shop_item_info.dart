import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_item_info.freezed.dart';
part 'shop_item_info.g.dart';

@freezed
class ShopItemInfo with _$ShopItemInfo {
  const factory ShopItemInfo({
    @Default("") String shopName,
    @Default("") String shopAddress,
    @Default("") String contactNumber,
    @Default([]) List<ShopItem> items,
  }) = _ShopItemInfo;

  factory ShopItemInfo.fromJson(Map<String, dynamic> json) =>
      _$ShopItemInfoFromJson(json);
}

@freezed
class ShopItem with _$ShopItem {
  const factory ShopItem({
    @Default("Unknown") String name,
    @Default(0) int quantity,
  }) = _ShopItem;

  factory ShopItem.fromJson(Map<String, dynamic> json) =>
      _$ShopItemFromJson(json);
}
