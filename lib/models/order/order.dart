import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/models/invoice/invoice.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    @Default(0) int id,
    @Default(0) int createdAt,
    @Default("") String invoiceNumber,
    @Default("") String status,
    @Default(false) bool dropOffService,
    @Default(0) num customerAchievedPoint,
    @Default(0) num currentCadRate,
    @Default(false) bool paid,
    @Default(0) num hourBooked,
    @Default(Invoice()) Invoice invoice,
    @Default(Address()) Address dropOffAddress,
    @Default([]) List<ShoppingDetails> shoppingDetailsList,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}