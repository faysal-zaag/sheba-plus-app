import 'package:sheba_plus/models/product/product.model.dart';

ProductModel product = const ProductModel(
  id: 123, // Provided value
  name: 'Cool Product', // Provided value
  description: 'This is a cool product', // Provided value
  price: 19, // Provided value
  // imageUrl and isFavorite are omitted, so they will use default values
);

List<ProductModel> mockProductList = [
  const ProductModel(
    id: 123,
    name: 'Cool Product', // Provided value
    description: 'This is a cool product', // Provided value
    price: 19,
  ),
  const ProductModel(
    id: 123,
    name: 'Cool Product', // Provided value
    description: 'This is a cool product', // Provided value
    price: 19,
  ),  const ProductModel(
    id: 123,
    name: 'Cool Product', // Provided value
    description: 'This is a cool product', // Provided value
    price: 19,
  ),
  const ProductModel(
    id: 123,
    name: 'Cool Product', // Provided value
    description: 'This is a cool product', // Provided value
    price: 19,
  ),
];
