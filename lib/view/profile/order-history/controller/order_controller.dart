import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class OrderController extends GetxController{
  final orderSearchController = TextEditingController().obs;
  final selectedOrderHistoryType = ProfileScreenTexts.activeOrder.tr.obs;
}