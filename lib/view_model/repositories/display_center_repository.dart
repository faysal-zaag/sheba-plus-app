import 'package:dio/dio.dart';

import '../../data/api/api_urls.dart';

/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class DisplayCenterServiceRepository {
  final Dio _dio;

  DisplayCenterServiceRepository(this._dio);

  Future<Response> getAllDisplayServiceProducts(
      {List<num>? categoryIdList,
        List<num>? subCategoryIdList,
      String? name,
      String? sort,
      num? priceFrom,
      num? priceTo,
      bool? available}) async {
    final queryParameters = <String, dynamic>{
      if (categoryIdList != null) 'categoryIds': categoryIdList,
      if (subCategoryIdList != null) 'subCategoryIds': subCategoryIdList,
      if (name != null) 'name': name,
      if (sort != null) 'sort': sort,
      if (priceFrom != null) 'priceFrom': priceFrom,
      if (priceTo != null) 'priceTo': priceTo,
      if (available != null) 'available': available,
    };

    return await _dio.get(
      ApiUrls.getAllDisplayServiceProductsApiUrl,
      queryParameters: queryParameters,
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
