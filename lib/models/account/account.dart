import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

part 'account.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @Default(0) int createdAt,
    @Default(0) int id,
    @Default(0) int balance,
    @Default(0) int totalSpent,
    @Default(0) int totalOrder,
    @Default(0) int point,
    @Default(0) int referralBonus,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}
