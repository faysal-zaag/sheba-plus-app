import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';

class HomeRepository{
  final Dio _dio;
  HomeRepository(this._dio);

  Future<Response> getServices()async{
    return await _dio.get(ApiUrls.servicesApiUrl);
  }
}