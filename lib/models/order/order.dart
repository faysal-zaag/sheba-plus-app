import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/models/invoice/invoice.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    @Default(0) int id,
    @Default(Invoice()) Invoice invoice,
    @Default(Address()) Address dropOffAddress,
    @Default([]) List<Order> shoppingDetailsList,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) =>
      _$OrderFromJson(json);
}