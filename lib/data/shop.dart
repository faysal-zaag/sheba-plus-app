import 'package:sheba_plus/data/shop_item.dart';

/**
 * Created by mahabubshozib on 12/5/24.
 * Author: Md Mahabub Hossain Shozib
 */

class Shop {
  int id;
  String name;
  String address;
  String phoneNumber;
  List<ShopItem> shopItemList;

  Shop(
      {required this.id,
      required this.name,
      required this.address,
      this.shopItemList = const [],
      required this.phoneNumber});
}
