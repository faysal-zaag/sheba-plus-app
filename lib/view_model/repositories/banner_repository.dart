import 'package:dio/dio.dart';

import '../../data/api/api_urls.dart';

/**
 * Created by mahabubshozib on 12/26/24.
 * Author: Md Mahabub Hossain Shozib
 */

class BannerRepository {
  final Dio _dio;
  BannerRepository(this._dio);

  Future<Response> getAllBanners({required String bannerType}) async {
    return await _dio.get(ApiUrls.getAllBanners, queryParameters: {
      'bannerType': bannerType
    });
  }
}