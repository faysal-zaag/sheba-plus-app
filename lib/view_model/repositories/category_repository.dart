import 'package:dio/dio.dart';

import '../../data/api/api_urls.dart';

/**
 * Created by mahabubshozib on 12/10/24.
 * Author: Md Mahabub Hossain Shozib
 */


class CategoryRepository {
  final Dio _dio;
  CategoryRepository(this._dio);

  Future<Response> getAllCategories() async {
    return await _dio.get(
      ApiUrls.getAllCategoryApiUrl,
    );
  }
  Future<Response> getAllSubCategories() async {
    return await _dio.get(
      ApiUrls.getAllSubCategoryApiUrl,
    );
  }
}