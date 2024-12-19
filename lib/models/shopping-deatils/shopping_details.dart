import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_details.freezed.dart';
part 'shopping_details.g.dart';

@freezed
class ShoppingDetails with _$ShoppingDetails {
  const factory ShoppingDetails({
    @Default(0) int id,
    @Default("") String shopName,
    @Default(0) int taxAmount,
    @Default(0) int vat,
    @Default(0) int totalItems,
    @Default(0) int totalItemPrice,
    @Default(0) int totalPrice,
    int? alreadyPaid,
    @Default([]) List<ShoppingItemDetails> shoppingItemDetailsList,
  }) = _ShoppingDetails;

  factory ShoppingDetails.fromJson(Map<String, dynamic> json) =>
      _$ShoppingDetailsFromJson(json);
}

@freezed
class ShoppingItemDetails with _$ShoppingItemDetails {
  const factory ShoppingItemDetails({
    @Default(0) int id,
    @Default(0) int price,
    @Default(0) int quantity,
    @Default(0) int totalPrice,
  }) = _ShoppingItemDetails;

  factory ShoppingItemDetails.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemDetailsFromJson(json);
}
