import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view_model/repositories/address.repository.dart';

class AddressController extends GetxController {
  final AddressRepository _addressRepository;

  AddressController(this._addressRepository);

  final addressCreateLoading = false.obs;
  final addressReadLoading = false.obs;
  final addressUpdateLoading = false.obs;
  final addresses = <Address>[].obs;
  final hasSavedAddress = false.obs;

  final addressTitle = "".obs;
  final addressMobileNumber = "".obs;
  final addressCountryCode = "".obs;
  final addressCountryIso = "".obs;
  final addressMobileNumberLength = 10.obs;
  final addressStreetController = TextEditingController().obs;
  final addressStreet2Controller = TextEditingController().obs;
  final addressCityController = TextEditingController().obs;
  final addressSelectedState = "".obs;
  final addressZipCodeController = TextEditingController().obs;
  final addressSelectedCountry = "".obs;
  final addressAdditionalInfo = TextEditingController().obs;

  // void methods
  void resetAddressFields() {
    addressTitle.value = "";
    addressMobileNumber.value = "";
    addressCountryCode.value = "";
    addressCountryIso.value = "";
    addressMobileNumberLength.value = 10; // Default length
    addressStreetController.value.clear();
    addressStreet2Controller.value.clear();
    addressCityController.value.clear();
    addressSelectedState.value = "";
    addressZipCodeController.value.clear();
    addressSelectedCountry.value = "";
    addressAdditionalInfo.value.clear();
  }

  void setAddressFieldsData({required Address address}) {
    addressTitle.value = address.title;
    addressSelectedCountry.value = address.country;
    addressStreetController.value.text = address.street;
    addressCityController.value.text = address.city;
    addressSelectedState.value = address.state;
    if (address.zipCode != null) {
      addressZipCodeController.value.text = address.zipCode.toString();
    }
    if (address.streetAlternative != null) {
      addressStreet2Controller.value.text = address.streetAlternative!;
    }
    if (address.addressDesc != null) {
      addressAdditionalInfo.value.text = address.addressDesc!;
    }
  }

  // Future methods
  Future<void> getAllAddress() async {
    try {
      addressReadLoading(true);
      hasSavedAddress(false);

      final response = await _addressRepository.readAllAddress();

      var addressListData = response.data["content"] as List;

      var addressList = addressListData.map((address) {
        return Address.fromJson(address);
      }).toList();

      if (addressList.isNotEmpty) hasSavedAddress(true);

      addresses(addressList);

      addressReadLoading(false);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      addressReadLoading(false);
    }
  }

  Future<bool> createAddress({String? title}) async {
    try {
      addressCreateLoading(true);
      Address address = getAddressData(title: title);
      await getAllAddress();
      await _addressRepository.createAddress(addressData: address);
      addressCreateLoading(false);
      return true;
    } catch (err) {
      addressCreateLoading(false);
      return false;
    }
  }

  Future<bool> updateAddress({required int addressId}) async {
    try {
      addressUpdateLoading(true);
      Address address = getAddressData();

      await _addressRepository.updateAddress(
          addressId: addressId, address: address);
      await getAllAddress();
      return true;
    } catch (err) {
      return false;
    } finally {
      addressUpdateLoading(false);
    }
  }

  Address getAddressData({String? title}) {
    return Address(
      title: title ?? addressTitle.value,
      city: addressCityController.value.text,
      country: addressSelectedCountry.value,
      state: addressSelectedState.value,
      street: addressStreetController.value.text,
      streetAlternative: addressStreet2Controller.value.text.isEmpty ? null : addressStreet2Controller.value.text,
      addressDesc: addressAdditionalInfo.value.text.isEmpty ? null : addressAdditionalInfo.value.text,
      zipCode: int.parse(
        addressZipCodeController.value.text,
      ),
    );
  }
}
