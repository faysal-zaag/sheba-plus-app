import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  const factory Invoice({
    @Default(0) num agentFee,
    @Default(0) num shoppingCost,
    @Default(0) num shippingCost,
    @Default(0) num dropOffCost,
    @Default(0) num totalVat,
    @Default(0) num totalTax,
    @Default(0) num totalProduct,
    @Default(0) num totalProductPrice,
    @Default(0) num totalAppliedPoint,
    @Default(0) num totalAppliedPointAmount,
    @Default(0) num totalPrice,
    @Default(0) num promoDiscount,
    @Default(0) num paidAmount,
    @Default(0) num finalPrice,
    @Default(0) num exactFinalPrice,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
}
