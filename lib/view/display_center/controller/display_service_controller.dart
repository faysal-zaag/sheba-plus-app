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
  final selectProductDetailsType = ''.obs;
  final totalDisplayServiceProduct = 630.obs;
  final displayServiceProductList = <DisplayServiceProduct>[].obs;

  var currentDisplayServiceProduct =  DisplayServiceProduct(id: 0, name: '', description: '', specification: '', quantity: 0, price: 0, discountPercentage: 0, thumbnailImage: '', totalSellAmount: 0, totalSellCount: 0, subCategoryList: [], colorList: [], createdBy: null, createdAt: 0, updatedAt: 0).obs;
  final productDetailsTypeList = [
    'DESCRIPTION',
    'SPECIFICATION',
    'ADDITIONAL',
  ];

  void onCarouselChange(int index) {
    carouselCurrentIndex(index);
  }

  // void getDisplayServiceProductById({required int id}) {
  //   try {
  //     loadingCurrentDisplayServiceProduct(true);
  //     var currentProduct =
  //         mockProductList.firstWhere((product) => product.id == id);
  //     currentDisplayServiceProduct.value = currentProduct;
  //     debugPrint(
  //         '====>> current display center product: ${currentDisplayServiceProduct.toJson()}',
  //         wrapWidth: 1024);
  //   } catch (e) {
  //     Utils.showErrorToast(message: 'Product not found by id');
  //   } finally {
  //     loadingCurrentDisplayServiceProduct(false);
  //   }
  // }


  // ================ Public Api call ==============
  Future<void> getAllDisplayCenterServiceProducts() async {
    try {
      loadingAllDisplayCenterServiceProducts(true);

      final response =
          await _displayCenterServiceRepository.getAllDisplayServiceProducts();

      var list = (response.data['content'] as List)
          .map((e) => DisplayServiceProduct.fromJson(e))
          .toList();
      displayServiceProductList(list);
      debugPrint(
          "all display products: ${displayServiceProductList.map((p) => p.toJson())}",
          wrapWidth: 1024);
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
      currentDisplayServiceProduct(response.data['Data']);

      debugPrint(
          "get display products: ${response.data}",
          wrapWidth: 1024);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingDisplayCenterServiceProductById(false);
    }
  }
}
