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
  final RxList<Shop> thirdPartyShops = <Shop>[].obs;

  @override
  void onInit() {
    super.onInit();
    addNewShop(); // Add an initial shop
  }

  void togglePaidOrNot({required int shopIndex}) {
    thirdPartyShops[shopIndex].alreadyPaid(!thirdPartyShops[shopIndex].alreadyPaid.value);
    thirdPartyShops.refresh();
  }

  void needPickUpServiceYesOrNot({required int shopIndex}) {
    thirdPartyShops[shopIndex].pickUpService(!thirdPartyShops[shopIndex].pickUpService.value);
    thirdPartyShops.refresh();
  }

  // Add a new shop
  void addNewShop() {
    thirdPartyShops.add(Shop());
  }

  // Delete a shop
  void deleteShop({required int shopIndex}) {
    if (thirdPartyShops.length > 1) thirdPartyShops.removeAt(shopIndex);
  }

  // Add a new item to a shop
  void addNewItem({required int shopIndex}) {
    thirdPartyShops[shopIndex].items.add(ShopItem());
    thirdPartyShops.refresh();
  }

  // Increase item quantity
  void increaseQuantity(int shopIndex, int itemIndex) {
    thirdPartyShops[shopIndex].items[itemIndex].increaseQuantity();
    thirdPartyShops.refresh();
  }

  // Decrease item quantity
  void decreaseQuantity(int shopIndex, int itemIndex) {
    thirdPartyShops[shopIndex].items[itemIndex].decreaseQuantity();
    thirdPartyShops.refresh();
  }
}

class Shop {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
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
