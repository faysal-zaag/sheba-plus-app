/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class ProductColor {
  final int id;
  final String name;
  final String code;
  final int price;

  ProductColor({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'price': price,
    };
  }
}