import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/category/category.dart';
import 'package:sheba_plus/utils/utils.dart';

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
  final allCategories = <Category>[].obs;

  // ================ Public Api call ==============
  Future<void> getAllCategories() async {
    try {
      loadingAllCategories(true);

      final response = await _categoryRepository.getAllCategories();
      var categoryList = (response.data['content'] as List)
          .map((e) => Category.fromJson(e))
          .toList();
      allCategories(categoryList);
      Utils.prettifyJson('${response.data}', 'get all categories');
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingAllCategories(false);
    }
  }
}
