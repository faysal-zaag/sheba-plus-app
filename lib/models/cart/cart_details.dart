import 'package:sheba_plus/models/display_service/color.dart';
import 'package:sheba_plus/models/display_service/product_size.dart';

import '../display_service/display_service_product.dart';

/**
 * Created by mahabub on 24/12/24.
 * Author: Mahabub Shozib
 */

class CartDetails {
   DisplayCenterProduct product;
   int quantity;
   ProductColor? color;
   ProductSize size;

  CartDetails({required this.product, required this.quantity, this.color, required this.size});

  factory CartDetails.fromJson(Map<String, dynamic> json) {
    return CartDetails(
      product: DisplayCenterProduct.fromJson(json['product']),
      quantity: json['quantity'], color: ProductColor.fromJson(json['color']),
      size: ProductSize.fromJson(json['size'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
      'color':color,
      'size':size
    };
  }
}