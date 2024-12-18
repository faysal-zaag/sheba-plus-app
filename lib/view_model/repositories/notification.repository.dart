import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/address/address.dart';

class NotificationRepository {
  final Dio _dio;

  NotificationRepository(this._dio);

  Future<Response> readAllNotification({bool? readStatus, int page = 0, String? userId, String? type}) async {
    Map<String, dynamic> filter = {"page": page};
    if (readStatus != null) {
      filter["readStatus"] = readStatus;
    }

    return await _dio.get(
      ApiUrls.notificationApiUrl,
      queryParameters: filter,
    );
  }


  Future<Response> markAsRead({required int notificationId}) async {
    return await _dio.put("${ApiUrls.markAsReadApiUrl}/$notificationId");
  }

  Future<Response> getLatestNotification({required int dataId}) async {
    return await _dio.get("${ApiUrls.getLatestNotificationApiUrl}/$dataId");
  }

  Future<Response> getSingleNotification({required int id}) async {
    return await _dio.get("${ApiUrls.getNotificationApiUrl}/$id");
  }

  Future<Response> markAllAsRead() async {
    return await _dio.put(ApiUrls.markAllAsReadApiUrl);
  }

  Future<Response> updateAddress({required int addressId, required Address address}) async {
    return await _dio.put("${ApiUrls.updateAddressApiUrl}/$addressId", data: address.toJson());
  }
}
