import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/address/address.dart';

class GlobalRepository {
  final Dio _dio;

  GlobalRepository(this._dio);

  Future<Response> getDefaultSetting() async {
    return await _dio.get(
      ApiUrls.publicSettingApiUrl,
    );
  }
}
