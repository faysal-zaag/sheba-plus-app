import 'package:sheba_plus/models/cart/cart_details.dart';

/**
 * Created by mahabub on 24/12/24.
 * Author: Mahabub Shozib
 */

class Cart {
  final List<CartDetails> cartDetailsList;

  Cart({required this.cartDetailsList});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      cartDetailsList: (json['cartDetailsList'] as List)
          .map((item) => CartDetails.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cartDetailsList': cartDetailsList.map((item) => item.toJson()).toList(),
    };
  }
}