import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    @Default('Unknown') String title,        // Default to 'Unknown'
    @Default('Unknown') String country,     // Default to 'Unknown'
    @Default('Unknown') String city,        // Default to 'Unknown'
    @Default('Unknown') String state,       // Default to 'Unknown'
    @Default('Unknown') String street,      // Default to 'Unknown'
    @Default(0) int zipCode,                // Default to 0
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
