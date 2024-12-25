import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ThirdPartyServiceController extends GetxController {
  final String thirdPartyServiceMessage =
      'Please list all the shop and Item information that we are going to receive from the 3rd party in our hub center at Bangladesh. Also add how much do we need to pay to the 3rd party.';
  final String pickUpServiceText =
      'If you opt for our pickup service, we will collect the products directly from the shop on your behalf. Please note that there will be an additional charge for this service, which we will inform you of after the pickup is completed. Rest assured, we’ll keep you updated on any costs involved to ensure transparency.';

  final alreadyPaid = true.obs;
  final needPickUpService = true.obs;

  // Shops list containing Shop objects
  final RxList<Shop> shops = <Shop>[].obs;

  @override
  void onInit() {
    super.onInit();
    addNewShop(); // Add an initial shop
  }

  void togglePaidOrNot({required int shopIndex}) {
    shops[shopIndex].alreadyPaid(!shops[shopIndex].alreadyPaid.value);
    shops.refresh();
  }

  void needPickUpServiceYesOrNot({required int shopIndex}) {
    shops[shopIndex].pickUpService(!shops[shopIndex].pickUpService.value);
    shops.refresh();
  }

  // Add a new shop
  void addNewShop() {
    shops.add(Shop());
  }

  // Delete a shop
  void deleteShop({required int shopIndex}) {
    if (shops.length > 1) shops.removeAt(shopIndex);
  }

  // Add a new item to a shop
  void addNewItem({required int shopIndex}) {
    shops[shopIndex].items.add(ShopItem());
    shops.refresh();
  }

  // Increase item quantity
  void increaseQuantity(int shopIndex, int itemIndex) {
    shops[shopIndex].items[itemIndex].increaseQuantity();
    shops.refresh();
  }

  // Decrease item quantity
  void decreaseQuantity(int shopIndex, int itemIndex) {
    shops[shopIndex].items[itemIndex].decreaseQuantity();
    shops.refresh();
  }
}

class Shop {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController unPaidTextController = TextEditingController();
  final TextEditingController howMuchNeedToPayController = TextEditingController();
  final RxBool alreadyPaid = false.obs;
  final RxBool pickUpService = false.obs;

  final RxList<ShopItem> items = <ShopItem>[ShopItem()].obs;

  // Toggle "already paid" status
  void toggleAlreadyPaid() {
    alreadyPaid.toggle();
  }

  // Toggle "pick up service" status
  void togglePickUpService() {
    pickUpService.toggle();
  }
}

class ShopItem {
  final TextEditingController itemNameController = TextEditingController();
  final RxInt quantity = 1.obs;

  // Increase item quantity
  void increaseQuantity() {
    quantity.value++;
  }

  // Decrease item quantity
  void decreaseQuantity() {
    if (quantity.value > 0) quantity.value--;
  }
}
