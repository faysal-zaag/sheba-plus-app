import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    @Default(0) num createdAt,
    @Default(0) num updatedAt,
    @Default(0) num id,
    @Default(0) num maxBudget,
    @Default(0) num hourlyRates,
    @Default(0) num tax,
    @Default(0) num vat,
    @Default('CAD') String currency,
    @Default(1) num currencyConversionRate,
    @Default(0) num agentTransportationFee,
    @Default(0) num dropOffCharge,
    @Default(0) num referralPoint,
    @Default(0) num referralPointConversionRate,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
