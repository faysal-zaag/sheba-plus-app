import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/login/login_request.model.dart';
import 'package:sheba_plus/models/register/register_request.model.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<Response> login({required LoginRequest loginRequest}) async {
    return await _dio.post(
      ApiUrls.loginApiUrl,
      data: loginRequest.toJson(),
    );
  }

  Future<Response> register({required RegisterRequest registerRequest}) async {
    return await _dio.post(
      ApiUrls.registerApiUrl,
      data: registerRequest.toJson(),
    );
  }
}
