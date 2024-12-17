import 'package:sheba_plus/models/display_service/display_service_product.dart';
import 'package:sheba_plus/models/executor/created_by.dart';
import 'package:sheba_plus/models/product/product.model.dart';

DisplayServiceProduct product = DisplayServiceProduct(
  id: 123,
  // Provided value
  name: 'Cool Product',
  // Provided value
  description: 'This is a cool product',
  // Provided value
  price: 19,
  specification: '',
  quantity: 0,
  discountPercentage: 11,
  thumbnailImage: '',
  totalSellAmount: 100,
  totalSellCount: 12,
  subCategoryList: [],
  colorList: [],
  createdBy: Executor(firstName: '', lastName: '', email: ''),
  createdAt: 1000000000,
  updatedAt: 100000000000, // Provided value
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
  ),
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
  ),
];
