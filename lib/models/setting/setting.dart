import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    int? createdAt,
    int? updatedAt,
    int? id,
    int? maxBudget,
    int? hourlyRates,
    double? tax,
    double? vat,
    String? currency,
    double? currencyConversionRate,
    int? dropOffCharge,
    int? referralPoint,
    int? referralPointConversionRate,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
}
