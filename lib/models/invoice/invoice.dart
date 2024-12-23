import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  const factory Invoice({
    @Default(0) int agentFee,
    @Default(0) int shoppingCost,
    @Default(0) int shippingCost,
    @Default(0) int dropOffCost,
    @Default(0) int totalVat,
    @Default(0) int totalTax,
    @Default(0) int totalProduct,
    @Default(0) int totalProductPrice,
    @Default(0) int totalAppliedPoint,
    @Default(0) int totalAppliedPointAmount,
    @Default(0) int totalPrice,
    @Default(0) int paidAmount,
    @Default(0) int finalPrice,
    @Default(0) int exactFinalPrice,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
}
