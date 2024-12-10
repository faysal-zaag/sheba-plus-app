import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/login/login_request.model.dart';
import 'package:sheba_plus/models/referral/referral.dart';
import 'package:sheba_plus/models/register/register_request.model.dart';
import 'package:sheba_plus/models/verification/verification_model.dart';
import 'package:sheba_plus/utils/device/device_utility.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<Response> login({required LoginRequest loginRequest}) async {
    return await _dio.post(
      ApiUrls.loginApiUrl,
      data: loginRequest.toJson(),
    );
  }

  Future<Response> applyReferral({required Referral referral}) async {
    return await _dio.post(
      ApiUrls.applyReferral,
      queryParameters: referral.toJson(),
    );
  }

  Future<Response> getProfile({String? accessToken}) async {
    final options = Options(
      headers: accessToken != null
          ? {'Authorization': 'Bearer $accessToken'}
          : null,
    );

    return await _dio.get(
      ApiUrls.getProfileApiUrl,
      options: options,
    );
  }


  Future<Response> register({required RegisterRequest registerRequest}) async {
    return await _dio.post(
      ApiUrls.registerApiUrl,
      data: registerRequest.toJson(),
    );
  }

  Future<Response> verifyEmail({required VerificationModel verificationModel}) async {
    return await _dio.post(
      ApiUrls.verifyEmailApiUrl,
      queryParameters: verificationModel.toJson(),
    );
  }

  Future<Response> verifyResetPasswordEmail({required VerificationModel verificationModel}) async {
    return await _dio.post(
      ApiUrls.verifyOtpApiUrl,
      queryParameters: verificationModel.toJson(),
    );
  }

  Future<Response> setNewPassword({required VerificationModel verificationModel, required String newPassword}) async {
    return await _dio.post(
      ApiUrls.verifyForgetPasswordApiUrl,
      data: {"newPassword" : newPassword},
      queryParameters: verificationModel.toJson(),
    );
  }

  Future<Response> resetPasswordByEmail({required String email}) async {
    return await _dio.post(
      ApiUrls.requestResetPasswordByEmail,
      queryParameters: {"email" : email},
    );
  }

  Future<Response> createDeviceToken({required int userId, required String fcmToken}) async {
    return await _dio.post(
      ApiUrls.createDeviceToken,
      data: {
        "userId": userId,
        "registrationToken": fcmToken,
        "applicationType" : DeviceUtils.isAndroid() ? "CONSUMER_APP" : "CONSUMER_APP_IOS"
      },
    );
  }

  Future<Response> removeDeviceToken({required String fcmToken}) async {
    return await _dio.delete(
      "${ApiUrls.removeDeviceToken}/$fcmToken",
    );
  }

  Future<Response> socialLogin(
      {required String firebaseToken,
        String fcmRegToken = "",
        String? fullName}) async {
    Map<String, dynamic> body = {};
    if (fullName != null && fullName.isNotEmpty) {
      body['fullName'] = fullName;
    }
    return await _dio.post(
      ApiUrls.socialLoginApiUrl,
      queryParameters: {
        "firebase-token": firebaseToken,
        "fcmRegToken": fcmRegToken,
      },
      data: body.isNotEmpty ? body : null,
    );
  }
}
