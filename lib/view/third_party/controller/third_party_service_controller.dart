import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/shop.dart';
import 'package:sheba_plus/data/shop_item.dart';

/**
 * Created by mahabubshozib on 12/5/24.
 * Author: Md Mahabub Hossain Shozib
 */

class ThirdPartyServiceController extends GetxController {
  final String thirdPartyServiceMessage =
      'Please list all the shop and Item information that we are going to receive from the 3rd party in our hub center at Bangladesh. Also add how much do we need to pay to the 3rd party.';
  final String pickUpServiceText =
      'If you opt for our pickup service, we will collect the products directly from the shop on your behalf. Please note that there will be an additional charge for this service, which we will inform you of after the pickup is completed. Rest assured, we’ll keep you updated on any costs involved to ensure transparency.';

  final shopItemList = <ShopItem>[].obs;
  final shopNameControllers = <TextEditingController>[];
  final shopAddressControllers = <TextEditingController>[];
  final contactNumberControllers = <TextEditingController>[];
  final itemNameControllers = <TextEditingController>[];
  final alreadyPaid = true.obs;
  final needPickUpService = true.obs;
  final List<Shop> shopList = [
    Shop(id: 1, name: '', address: '', phoneNumber: ''),
  ].obs;

  void togglePaidOrNot() {
    alreadyPaid(!alreadyPaid.value);
  }
  void needPickUpServiceYesOrNot() {
    needPickUpService(!needPickUpService.value);
  }
}
