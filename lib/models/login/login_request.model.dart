import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.model.freezed.dart';
part 'login_request.model.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  // Factory constructor for JSON deserialization
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
