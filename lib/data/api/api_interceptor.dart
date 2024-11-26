import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/utils/utils.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      final requestData = options.data;
      final dataToLog = requestData is FormData
          ? requestData.fields.toString() // Handle FormData safely
          : requestData?.toString() ?? "No Data";

      Log.info("API Request", data: {
        "Method": options.method,
        "Url": options.uri.toString(),
        "Headers": options.headers,
        "Data": dataToLog,
      });
    } catch (e) {
      Log.error("Error logging API Request", error: e);
    }
    options.headers['Authorization'] = "Bearer ${StorageService().getAuthToken()}";
    handler.next(options); // Continue the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      Log.info("API Response", data: {
        "Status Code": response.statusCode,
        "Message": response.statusMessage,
        "Data": response.data,
      });
    }
    handler.next(response); // Pass the response
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Custom error handling
    if (kDebugMode) {
      Log.error(
        "DioError occurred",
        error: {
          "Status Code": err.response?.statusCode,
          "Message": err.response?.data?["message"],
        },
      );
    }

    if (err.type == DioExceptionType.connectionTimeout) {
      Utils.showErrorToast(message: 'Connection Timeout');
    } else if (err.type == DioExceptionType.receiveTimeout) {
      Utils.showErrorToast(message: 'Receive Timeout');
    } else if (err.type == DioExceptionType.badResponse) {
      switch (err.response?.statusCode) {
        case 400:
        case 401:
        case 403:
        case 404:
          Utils.showErrorToast(message: err.response?.data?["message"]);
          break;
        default:
          Log.warning(
            "Unhandled status code: ${err.response?.statusCode}. Message: ${err.message}",
          );
          Utils.showErrorToast(message: "Error occurred.");
      }
    } else if (err.type == DioExceptionType.sendTimeout) {
      Utils.showErrorToast(message: 'Send Timeout');
    } else if (err.type == DioExceptionType.cancel) {
      Utils.showErrorToast(message: 'Request Cancelled');
    } else if (err.message?.contains("Failed host lookup") == true) {
      Utils.showErrorToast(message: "Service Not Available");
    } else {
      Utils.showErrorToast(message: err.message ?? "Unknown Error");
    }

    handler.next(err); // Pass the error
  }
}
