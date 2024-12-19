import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/category/category.dart';
import 'package:sheba_plus/models/display_service/sub_category.dart';
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
  final allSubCategories = <SubCategory>[].obs;
  final showAllCategories = false.obs;
  final showAllSubCategories = false.obs;
  final categoryIds = <num>[].obs;
  final subCategoryIds = <num>[].obs;
  final productAvailability = <String>['In-stock', 'Out of stock'];
  final selectProductAvailability = ''.obs;
  final productSortByItems = <String>['Newest', 'Price : Low to high', 'Price : High to low'];
  final selectedSortBy = ''.obs;

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

  Future<void> getAllSubCategories() async {
    try {
      loadingAllCategories(true);

      final response = await _categoryRepository.getAllSubCategories();
      var categoryList = (response.data['content'] as List)
          .map((e) => SubCategory.fromJson(e))
          .toList();
      allSubCategories(categoryList);
      Utils.prettifyJson('${response.data}', 'get all sub categories');
    } catch (err) {
      Log.error(err.toString());
    } finally {
      loadingAllCategories(false);
    }
  }

  void resetData() {
    showAllCategories(false);
    showAllSubCategories(false);
    categoryIds([]);
    subCategoryIds([]);
    selectProductAvailability('');
    selectedSortBy('');
  }
}
