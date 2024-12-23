class ProductServices {
  static String getAmount({required num price}) {
    // Check if the price is a whole number
    if (price == price.toInt()) {
      return price.toInt().toString();
    }
    return price.toStringAsFixed(2);
  }
}
