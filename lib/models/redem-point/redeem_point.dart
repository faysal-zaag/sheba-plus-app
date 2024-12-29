import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_plus/models/user/user.dart';

part 'redeem_point.freezed.dart';

part 'redeem_point.g.dart';

@freezed
class RedeemPoint with _$RedeemPoint {
  factory RedeemPoint({
    @Default(0) int createdAt,
    @Default(0) int id,
    @Default("") String redeemPointAction,
    @Default("") String redeemedBy,
    String? invoiceNumber,
    @Default(0) int point,
    @Default(User()) User customer,
    @Default(User()) User? referredBy,
    @Default(User()) User? referredTo,
  }) = _RedeemPoint;

  factory RedeemPoint.fromJson(Map<String, dynamic> json) => _$RedeemPointFromJson(json);
}
