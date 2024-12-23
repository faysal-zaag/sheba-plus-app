import 'package:freezed_annotation/freezed_annotation.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    @Default(0) int createdAt,
    @Default(0) int updatedAt,
    @Default(0) int id,
    @Default(0) int maxBudget,
    @Default(0) int hourlyRates,
    @Default(0.0) double tax,
    @Default(0.0) double vat,
    @Default('CAD') String currency,
    @Default(1.0) double currencyConversionRate,
    @Default(0) int dropOffCharge,
    @Default(0) int referralPoint,
    @Default(0) int referralPointConversionRate,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}
