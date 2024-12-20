import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/address/address.dart';


class AddressRepository {
  final Dio _dio;
  AddressRepository(this._dio);

  Future<Response> createAddress({required Address addressData}) async {
    return await _dio.post(
      "${ApiUrls.addressApiUrl}/create",
      data: addressData.toJson(),
    );
  }

  Future<Response> readAllAddress() async {
    return await _dio.get(ApiUrls.addressApiUrl);
  }

  Future<Response> updateAddress(
      {required int addressId, required Address address}) async {
    return await _dio.put("${ApiUrls.updateAddressApiUrl}/$addressId", data: address.toJson());
  }
}
