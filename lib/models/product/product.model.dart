import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.model.freezed.dart';
part 'product.model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default(0) int id,
    @Default('') String? name,
    @Default('') String? description,
    @Default(0) num? price,
    @Default('') String? imageUrl,
    @Default(false) bool? isFavorite,
  }) = _ProductModel;

  // Factory method to convert JSON to ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
