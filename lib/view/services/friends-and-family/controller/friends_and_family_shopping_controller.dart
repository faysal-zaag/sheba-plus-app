import 'package:get/get.dart';
import 'package:sheba_plus/view/services/third_party/controller/third_party_service_controller.dart';

class FriendsAndFamilyShoppingController extends GetxController {
  final headerText = "Friends & Family Shipment Info".tr;

  String get friendsFamilyServiceMessage => 'Please provide us with the necessary details about your relatives or friends who will be sending the items, '
      'including their contact information, along with the item names and quantities they are sending to us for shipment.';

  String get pickUpServiceText => 'If you opt for our pickup service, we will collect the products directly from the shop on your behalf. '
      'Please note that there will be an additional charge for this service, which we will inform you of after the pickup is completed. Rest assured, '
      'we’ll keep you updated on any costs involved to ensure transparency.';

  final alreadyPaid = true.obs;
  final needPickUpService = true.obs;

  // Shops list containing Shop objects
  final RxList<Shop> friendsAndFamilyShops = <Shop>[].obs;

  @override
  void onInit() {
    super.onInit();
    addNewShop(); // Add an initial shop
  }

  void togglePaidOrNot({required int shopIndex}) {
    friendsAndFamilyShops[shopIndex].alreadyPaid(!friendsAndFamilyShops[shopIndex].alreadyPaid.value);
    friendsAndFamilyShops.refresh();
  }

  void needPickUpServiceYesOrNot({required int shopIndex}) {
    friendsAndFamilyShops[shopIndex].pickUpService(!friendsAndFamilyShops[shopIndex].pickUpService.value);
    friendsAndFamilyShops.refresh();
  }

  // Add a new shop
  void addNewShop() {
    friendsAndFamilyShops.add(Shop());
  }

  // Delete a shop
  void deleteShop({required int shopIndex}) {
    if (friendsAndFamilyShops.length > 1) friendsAndFamilyShops.removeAt(shopIndex);
  }

  // Add a new item to a shop
  void addNewItem({required int shopIndex}) {
    friendsAndFamilyShops[shopIndex].items.add(ShopItem());
    friendsAndFamilyShops.refresh();
  }

  // Increase item quantity
  void increaseQuantity(int shopIndex, int itemIndex) {
    friendsAndFamilyShops[shopIndex].items[itemIndex].increaseQuantity();
    friendsAndFamilyShops.refresh();
  }

  // Decrease item quantity
  void decreaseQuantity(int shopIndex, int itemIndex) {
    friendsAndFamilyShops[shopIndex].items[itemIndex].decreaseQuantity();
    friendsAndFamilyShops.refresh();
  }
}
