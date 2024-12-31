import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code.freezed.dart';
part 'promo_code.g.dart';

@freezed
class PromoCode with _$PromoCode {
  const factory PromoCode({
    @Default("") String code,
    @Default("") String validFrom,
    @Default("") String validTo,
    @Default("") String discountType,
    @Default(0) int percent,
    @Default(0) int flatAmount,
  }) = _PromoCode;

  factory PromoCode.fromJson(Map<String, dynamic> json) => _$PromoCodeFromJson(json);
}
