import 'package:dio/dio.dart';

class ProfileRepository{
  final Dio _dio;
  ProfileRepository(this._dio);

  // Future<Response> changeProfileImage({required String imageKey}) async {
  //   return await _dio
  //       .patch(GET_USER_PROFILE_API_URL, data: {"profilePicture": imageKey});
  // }
}