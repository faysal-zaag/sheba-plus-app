import 'package:sheba_plus/models/display_service/product_image.dart';
import 'package:sheba_plus/models/display_service/product_size.dart';

import '../executor/created_by.dart';
import 'color.dart';
import 'sub_category.dart';

/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class DisplayServiceProduct {
  final int id;
  final String name;
  final String description;
  final String specification;
  final String? additionalInfo;
  final String? sku;
  final int quantity;
  final num price;
  num discountPrice;
  final num? discountPercentage;
  final String thumbnailImage;
  final num totalSellAmount;
  final num totalSellCount;
  final List<SubCategory> subCategoryList;
  final List<ProductColor> colorList;
  final List<ProductSize> sizeList;
  final List<ProductImage> images;
  final CreatedBy? createdBy;
  final int createdAt;
  final int updatedAt;

  DisplayServiceProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.specification,
    this.additionalInfo,
    this.sku,
    required this.quantity,
    required this.price,
    this.discountPercentage,
    this.sizeList = const [],
    required this.thumbnailImage,
    required this.totalSellAmount,
    required this.totalSellCount,
    required this.subCategoryList,
    required this.colorList,
    this.discountPrice = 0,
    this.createdBy,
    this.images = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  // From JSON
  factory DisplayServiceProduct.fromJson(Map<String, dynamic> json) {
    return DisplayServiceProduct(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      specification: json['specification'],
      additionalInfo: json['additionalInfo'],
      sku: json['sku'],
      quantity: json['quantity'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      thumbnailImage: json['thumbnailImage'],
      totalSellAmount: json['totalSellAmount'],
      totalSellCount: json['totalSellCount'],
      subCategoryList: (json['subCategoryList'] as List)
          .map((item) => SubCategory.fromJson(item))
          .toList(),
      colorList: (json['colorList'] as List)
          .map((item) => ProductColor.fromJson(item))
          .toList(),
      sizeList: json['sizeList'] != null  ? (json['sizeList'] as List)
          .map((item) => ProductSize.fromJson(item))
          .toList() : [],
      images: json['images'] != null  ? (json['images'] as List)
          .map((item) => ProductImage.fromJson(item))
          .toList() : [],
      createdBy: CreatedBy.fromJson(json['createdBy']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'specification': specification,
      'additionalInfo': additionalInfo,
      'sku': sku,
      'quantity': quantity,
      'price': price,
      'discountPercentage': discountPercentage,
      'thumbnailImage': thumbnailImage,
      'totalSellAmount': totalSellAmount,
      'totalSellCount': totalSellCount,
      'images': images,
      'subCategoryList': subCategoryList.map((item) => item.toJson()).toList(),
      'colorList': colorList.map((item) => item.toJson()).toList(),
      'sizeList': sizeList.map((item) => item.toJson()).toList(),
      'createdBy': createdBy?.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}