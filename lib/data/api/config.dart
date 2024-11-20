import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/utils/utils.dart';

class Api {
  Dio dio = Dio();
  final getStorage = GetStorage();

  Api() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseApiUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers['Authorization'] = "Bearer ${GetStorageRepository().getAuthToken()}";
          print("${options.method} : ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          debugPrint(
              "${error.response?.statusCode} dioError message====>${error.response?.data["message"]}",
              wrapWidth: 1024);
          if (error.type == DioExceptionType.connectionTimeout) {
            Utils.showErrorToast(message: 'Connection Timeout');
          } else if (error.type == DioExceptionType.receiveTimeout) {
            Utils.showErrorToast(message: 'Receive Timeout');
          } else if (error.type == DioExceptionType.badResponse) {
            if (error.response?.statusCode == 400) {
              Utils.showErrorToast(message: error.response?.data["message"]);
            } else if (error.response?.statusCode == 401) {
              Utils.showErrorToast(message: error.response?.data["message"]);
            } else if (error.response?.statusCode == 403) {
              Utils.showErrorToast(message: error.response?.data["message"]);
              // GetStorageRepository().removeAuthToken();
            }
            else if (error.response?.statusCode == 404) {
              Utils.showErrorToast(message: error.response?.data["message"]);
            }else {
              debugPrint(
                  "${error.response?.statusCode} dioError message====>${error.response?.data["message"]}",
                  wrapWidth: 1024);
              Utils.showErrorToast(message: "Error occurred.");
            }
          } else if (error.type == DioExceptionType.sendTimeout) {
            Utils.showErrorToast(message: 'Send Timeout');
          } else if (error.type == DioExceptionType.cancel) {
            Utils.showErrorToast(message: 'Request Cancelled');
          } else if (error.message!.contains("Failed host lookup")) {
            Utils.showErrorToast(message: "Service Not Available");
          } else {
            Utils.showErrorToast(message: error.message ?? "Unknown Error");
          }

          return handler.next(error);
        },
      ),
    );
  }
}
