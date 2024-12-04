import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/mock_data.dart';
import 'package:sheba_plus/models/product/product.model.dart';

import '../../../utils/utils.dart';

/**
 * Created by mahabubshozib on 12/1/24.
 * Author: Md Mahabub Hossain Shozib
 */

class DisplayCenterServiceController extends GetxController {
  final totalDisplayServiceProduct = 630.obs;
  var currentDisplayServiceProduct = const ProductModel().obs;
  final loadingCurrentDisplayServiceProduct = false.obs;
  final carouselCurrentIndex = 0.obs;
  final selectProductDetailsType = ''.obs;
  final productDetailsTypeList = [
    'DESCRIPTION',
    'SPECIFICATION',
    'ADDITIONAL',
  ];

  void onCarouselChange(int index) {
    carouselCurrentIndex(index);
  }

  void getDisplayServiceProductById({required int id}) {
    try {
      loadingCurrentDisplayServiceProduct(true);
      var currentProduct =
          mockProductList.firstWhere((product) => product.id == id);
      currentDisplayServiceProduct.value = currentProduct;
      debugPrint(
          '====>> current display center product: ${currentDisplayServiceProduct.toJson()}',
          wrapWidth: 1024);
    } catch (e) {
      Utils.showErrorToast(message: 'Product not found by id');
    } finally {
      loadingCurrentDisplayServiceProduct(false);
    }
  }
}
