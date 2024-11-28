import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';

class ProfileRepository{
  final Dio _dio;
  ProfileRepository(this._dio);

  Future<Response> changeProfileImage({required String imageKey}) async {
    return await _dio
        .patch(ApiUrls.getProfileImageApiUrl, data: {"profilePicture": imageKey});
  }
}