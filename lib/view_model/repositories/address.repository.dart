import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/address/address.dart';


class AddressRepository {
  final Dio _dio;
  AddressRepository(this._dio);

  Future<Response> createAddress(Address addressData) async {
    return await _dio.post(
      ApiUrls.addressApiUrl,
      data: addressData.toJson(),
    );
  }

  Future<Response> readAllAddress() async {
    return await _dio.get(ApiUrls.addressApiUrl);
  }

  Future<Response> updateAddress(
      {required int addressId, required Address address}) async {
    return await _dio.patch(ApiUrls.addressApiUrl,
        queryParameters: {"id": addressId}, data: address.toJson());
  }

  Future<Response> deleteAddress({required int addressId}) async {
    return await _dio.delete("${ApiUrls.addressApiUrl}?id=$addressId");
  }
}
