import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/logger.dart';
import '../../../view_model/repositories/category_repository.dart';

/**
 * Created by mahabubshozib on 12/10/24.
 * Author: Md Mahabub Hossain Shozib
 */

class CategoryController extends GetxController {
  final CategoryRepository _categoryRepository;

  CategoryController(this._categoryRepository);

  final loadingAllCategories = false.obs;

  // ================ Public Api call ==============
  Future<void> getAllCategories() async {
    try {
      loadingAllCategories(true);

      final response = await _categoryRepository.getAllCategories();
      debugPrint("all display products: ${response.data}", wrapWidth: 1024);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingAllCategories(false);
    }
  }
}
