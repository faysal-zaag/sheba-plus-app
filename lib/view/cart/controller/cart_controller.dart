import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/cart/cart.dart';

import '../../../models/cart/cart_details.dart';
import '../../../utils/utils.dart';

/**
 * Created by mahabubshozib on 12/4/24.
 * Author: Md Mahabub Hossain Shozib
 */

class CartController extends GetxController {
  final cart = Cart(cartDetailsList: <CartDetails>[].obs).obs;
  final subTotal = 0.0.obs;

  void addProductIntoCart(
      {required CartDetails cartDetails, required int quantity}) {
    final exist = cart.value.cartDetailsList
        .where((element) => element.product.id == cartDetails.product.id);

    if (exist.isNotEmpty) {
      cart.value.cartDetailsList.map((e) {
        if (e.product.id == cartDetails.product.id) {
          e.quantity = quantity;
        }
        return e;
      }).toList();
    } else {
      cart.value.cartDetailsList.add(cartDetails);
    }
    calculateSubTotal();

    debugPrint(
        "===>> products in cart: ${cart.value.cartDetailsList.map((product) => product.toJson())}",
        wrapWidth: 1024);
  }

  void removeProductFromCart({required int id}) {
    cart.value.cartDetailsList
        .removeWhere((element) => element.product.id == id);
  }

  void calculateSubTotal() {
    subTotal(0.0);
    for (int i = 0; i < cart.value.cartDetailsList.length; i++) {
      CartDetails cartDetails = cart.value.cartDetailsList[i];
      var res = cartDetails.product.discountPercentage == 0.0
          ? multiplyProductAndPrice(
              price: cartDetails.product.price ?? 0,
              quantity: cartDetails.quantity ?? 0)
          : multiplyProductAndPrice(
              price: Utils.getDiscountPrice(
                  price: cartDetails.product.price ?? 0,
                  percent: cartDetails.product.discountPercentage ?? 0),
              quantity: cartDetails.quantity ?? 0);
      subTotal.value += res;
    }
  }

  num multiplyProductAndPrice({required num price, required int quantity}) {
    return price * quantity;
  }
}
