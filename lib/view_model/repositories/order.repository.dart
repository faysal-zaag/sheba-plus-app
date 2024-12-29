import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/address/address.dart';

class OrderRepository {
  final Dio _dio;

  OrderRepository(this._dio);

  Future<Response> getAllOrders({bool? onGoing, int page = 0, String? invoiceNo, String? type}) async {
    Map<String, dynamic> filter = {"page": page};
    if (onGoing != null) {
      filter["onGoing"] = onGoing;
    }
    if (invoiceNo != null) {
      filter["invoiceNo"] = invoiceNo;
    }

    return await _dio.get(
      ApiUrls.getOrdersApiUrl,
      queryParameters: filter,
    );
  }

  Future<Response> getOrderDetails({required int orderId})async{
    return await _dio.get("${ApiUrls.getOrderDetailsApiUrl}/$orderId");
  }
}
