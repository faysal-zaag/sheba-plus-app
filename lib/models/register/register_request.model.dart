import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.model.freezed.dart';
part 'register_request.model.g.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) = _RegisterRequest;

  // Factory constructor for JSON deserialization
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
