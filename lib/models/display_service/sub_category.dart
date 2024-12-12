/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class SubCategory {
  final int id;
  final String name;

  SubCategory({
    required this.id,
    required this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}