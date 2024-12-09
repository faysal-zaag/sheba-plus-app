import 'package:dio/dio.dart';

import '../../data/api/api_urls.dart';

/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class DisplayCenterServiceRepository {
  final Dio _dio;

  DisplayCenterServiceRepository(this._dio);

  Future<Response> getAllDisplayServiceProducts() async {
    return await _dio.get(
      ApiUrls.getAllDisplayServiceProductsApiUrl,
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
    );
  }

  Future<Response> getProductById({required int id}) async {
    return await _dio
        .get('${ApiUrls.getAllDisplayServiceProductsApiUrl}/id/$id');
  }
}
