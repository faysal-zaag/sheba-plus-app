import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
class Referral with _$Referral {
  factory Referral({
    required String fullName,
    required String countryCode,
    required String mobileNumber,
  }) = _Referral;

  factory Referral.fromJson(Map<String, dynamic> json) => _$ReferralFromJson(json);
}
