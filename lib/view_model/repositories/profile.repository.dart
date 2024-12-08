import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/verification/verification_model.dart';

class ProfileRepository{
  final Dio _dio;
  ProfileRepository(this._dio);

  Future<Response> changeProfileImage({required String imageKey}) async {
    return await _dio
        .patch(ApiUrls.getProfileImageApiUrl, data: {"profilePicture": imageKey});
  }

  Future<Response> changePassword({required String oldPassword, required String newPassword}) async {
    return await _dio.post(
      ApiUrls.changePassword,
      data: {"oldPassword" : oldPassword, "newPassword" : newPassword,},
    );
  }
}