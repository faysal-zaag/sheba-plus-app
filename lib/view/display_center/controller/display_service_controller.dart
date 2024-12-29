import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/mock_data.dart';
import 'package:sheba_plus/models/product/product.model.dart';
import 'package:sheba_plus/view_model/repositories/display_center_repository.dart';

import '../../../models/display_service/display_service_product.dart';
import '../../../utils/logger.dart';
import '../../../utils/utils.dart';

/**
 * Created by mahabubshozib on 12/1/24.
 * Author: Md Mahabub Hossain Shozib
 */

class DisplayCenterServiceController extends GetxController {
  final DisplayCenterServiceRepository _displayCenterServiceRepository;

  DisplayCenterServiceController(this._displayCenterServiceRepository);

  final loadingCurrentDisplayServiceProduct = false.obs;
  final loadingAllDisplayCenterServiceProducts = false.obs;
  final loadingDisplayCenterServiceProductById = false.obs;

  final carouselCurrentIndex = 0.obs;
  final selectProductDetailsType = 'DESCRIPTION'.obs;
  final totalDisplayServiceProduct = 0.obs;
  final displayServiceProductList = <DisplayCenterProduct>[].obs;
  final productNameSearchController = TextEditingController().obs;

  var currentDisplayServiceProduct = DisplayCenterProduct(
          id: 0,
          name: '',
          description: '',
          specification: '',
          quantity: 0,
          price: 0,
          discountPercentage: 0,
          thumbnailImage: '',
          totalSellAmount: 0,
          totalSellCount: 0,
          subCategoryList: [],
          colorList: [],
          createdBy: null,
          createdAt: 0,
          updatedAt: 0)
      .obs;
  final productDetailsTypeList = [
    'DESCRIPTION',
    'SPECIFICATION',
    'ADDITIONAL',
  ];

  void onCarouselChange(int index) {
    carouselCurrentIndex(index);
  }

  num calculateDiscountPrice(
      {required num productPrice, num? discountPercentage}) {
    num discountPrice = ((productPrice) * ((discountPercentage ?? 0) / 100));
    return discountPrice;
  }

  num calculatePriceAfterDiscount({required num price, num? discountPrice}) {
    num finalPrice = ((price) - (discountPrice ?? 0));
    return finalPrice;
  }

  void resetData() {
    productNameSearchController.value.clear();
  }

  // ================ Public Api call ==============
  Future<void> getAllDisplayCenterServiceProducts(
      {List<num>? categoryIdList,
      List<num>? subCategoryIdList,
      String? name,
      String? sort,
      num? priceFrom,
      num? priceTo,
      bool? available}) async {
    try {
      loadingAllDisplayCenterServiceProducts(true);

      final response =
          await _displayCenterServiceRepository.getAllDisplayServiceProducts(
              name: name,
              available: available,
              categoryIdList: categoryIdList,
              priceFrom: priceFrom,
              priceTo: priceTo,
              sort: sort,
              subCategoryIdList: subCategoryIdList);

      var list = (response.data['content'] as List)
          .map((e) => DisplayCenterProduct.fromJson(e))
          .toList();
      displayServiceProductList(list);
      totalDisplayServiceProduct(response.data['totalElements']);
      // debugPrint("all display products: ${response.data}", wrapWidth: 1024);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingAllDisplayCenterServiceProducts(false);
    }
  }

  Future<void> getDisplayCenterServiceProductById({required int id}) async {
    try {
      loadingDisplayCenterServiceProductById(true);
      final response =
          await _displayCenterServiceRepository.getProductById(id: id);
      currentDisplayServiceProduct(
          DisplayCenterProduct.fromJson(response.data));
      currentDisplayServiceProduct.value.discountPrice = calculateDiscountPrice(
          productPrice: currentDisplayServiceProduct.value.price,
          discountPercentage:
              currentDisplayServiceProduct.value.discountPercentage);
      Utils.prettifyJson(response.data, 'Single product response data');
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingDisplayCenterServiceProductById(false);
    }
  }
}
