import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default('') String email, // Default value as an empty string
    @Default('') String firstName, // Default value as an empty string
    @Default('') String lastName, // Default value as an empty string
    String? profilePicture, // Optional field
    int? mobileNumber, // Optional field
    String? countryCode, // Optional field
    num? dateOfBirth, // Optional field
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
