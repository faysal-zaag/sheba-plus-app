import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';

part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    @Default(0) int id,
    @Default('Unknown') String title,
    @Default('Unknown') String country,
    @Default('Unknown') String city,
    @Default('Unknown') String state,
    @Default('Unknown') String street,
    String? streetAlternative,
    String? countryCode,
    String? mobileNumber,
    String? addressDesc,
    int? zipCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
