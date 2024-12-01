import 'package:get/get.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/view_model/repositories/address.repository.dart';

class AddressController extends GetxController{
  final AddressRepository _addressRepository;

  AddressController(this._addressRepository);

  final addressCreateLoading = false.obs;
  final addressReadLoading = false.obs;
  final addressUpdateLoading = false.obs;
  final addresses = <Address>[].obs;
  final hasSavedAddress = false.obs;
  // final defaultAddress = Address().obs;

  Future<void> getAllAddress() async {
    try {
      addressReadLoading(true);

      final response = await _addressRepository.readAllAddress();

      var addressListData = response.data['docs'] as List;

      var addressList = addressListData.map((address) {
        return Address.fromJson(address);
      }).toList();

      if(addressList.isNotEmpty) hasSavedAddress(true);

      addresses(addressList);

      addressReadLoading(false);
    } catch (err) {
      addressReadLoading(false);
    }
  }

  Future<bool> createAddress({required Address addressData}) async {
    try {
      addressCreateLoading(true);
      final response = await _addressRepository.createAddress(addressData);
      addressCreateLoading(false);
      return true;
    } catch (err) {
      addressCreateLoading(false);
      return false;
    }
  }

  Future<bool> updateAddress({String? addressId, required Address address}) async {
    try {
      addressUpdateLoading(true);
      Address addressData = address;

      if (addressId == null) {
        addressData = Address();
      }

      // await _addressRepository.updateAddress(addressId: addressId ?? address.id, address: addressData);
      await getAllAddress();
      return true;
    } catch (err) {
      return false;
    } finally {
      addressUpdateLoading(false);
    }
  }

  Future<bool> deleteAddress({required String addressId}) async {
    try {
      // await _addressRepository.deleteAddress(addressId: addressId);
      await getAllAddress();

      return true;
    } catch (err) {
      return false;
    } finally {
      addressCreateLoading(false);
    }
  }
}
