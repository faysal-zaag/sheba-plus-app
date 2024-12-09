/**
 * Created by mahabubshozib on 12/9/24.
 * Author: Md Mahabub Hossain Shozib
 */

class Color {
  final int id;
  final String name;
  final String code;
  final int price;

  Color({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
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