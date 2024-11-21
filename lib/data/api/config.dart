import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'api_interceptor.dart';

class Api {
  final Dio dio = Dio();
  final getStorage = GetStorage();

  Api() {
    dio.options = BaseOptions(
      baseUrl: ApiUrls.baseApiUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      receiveTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );

    // Add the custom interceptor
    dio.interceptors.add(ApiInterceptor());
  }
}
