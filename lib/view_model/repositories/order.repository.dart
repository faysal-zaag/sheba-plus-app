import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/address/address.dart';

class OrderRepository {
  final Dio _dio;

  OrderRepository(this._dio);

  Future<Response> getAllOrders({bool? onGoing, int page = 0, String? userId, String? type}) async {
    Map<String, dynamic> filter = {"page": page};
    if (onGoing != null) {
      filter["onGoing"] = onGoing;
    }

    return await _dio.get(
      ApiUrls.getOrdersApiUrl,
      queryParameters: filter,
    );
  }
}
