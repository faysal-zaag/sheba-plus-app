/**
 * Created by mahabubshozib on 12/10/24.
 * Author: Md Mahabub Hossain Shozib
 */

class ProductSize {
  final int id;
  final String? name;
  final bool? available;
  final double? price;

  ProductSize({
    this.id = 0,
    this.name,
    this.available,
    this.price,
  });


  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'] as int,
      name: json['name'] as String,
      available: json['available'] as bool,
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'available': available,
      'price': price,
    };
  }
}
