import 'package:sheba_plus/models/executor/created_by.dart';

/**
 * Created by mahabubshozib on 12/12/24.
 * Author: Md Mahabub Hossain Shozib
 */

class Category {
  final int id;
  final String name;
  final String? image;
  final num createdAt;
  final num? updatedAt;
  final Executor? createdBy;
  final Executor? updatedBy;

  Category({
    this.id = 0,
    required this.name,
    this.image,
    required this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdBy: json['createdBy'] != null
          ? Executor.fromJson(json['createdBy'])
          : null,
      updatedBy: json['updatedBy'] != null
          ? Executor.fromJson(json['updatedBy'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'createdBy': createdBy?.toJson(),
      'updatedBy': updatedBy?.toJson(),
    };
  }
}
