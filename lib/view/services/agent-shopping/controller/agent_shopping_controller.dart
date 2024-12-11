import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum PaymentMethod { td, paypal }

class AgentShoppingController extends GetxController {
  final agentShoppingMeetingLocationController = TextEditingController().obs;
  final agentShoppingEasternTimeController = TextEditingController().obs;
  final agentShoppingEasternTime = 0.obs;
  final agentShoppingBDTimeController = TextEditingController().obs;
  final agentShoppingBDTime = 0.obs;
  final agentShoppingSpendAmountController = TextEditingController().obs;
  final agentShoppingServiceDurationController = TextEditingController().obs;
  final agentShoppingServiceTotalCostController = TextEditingController().obs;
  final agentShoppingDropOffService = true.obs;
  final sameAsHomeAddress = true.obs;
  final paymentMethod = PaymentMethod.td.obs;

  void togglePaymentMethod({required PaymentMethod method}) {
    if (paymentMethod.value != PaymentMethod.td && method == PaymentMethod.td) {
      paymentMethod(PaymentMethod.td);
    }
    if (paymentMethod.value == PaymentMethod.td && method != PaymentMethod.td) {
      paymentMethod(PaymentMethod.paypal);
    }
  }

  void toggleDropOffService(int index) {
    if (index == 0 && agentShoppingDropOffService.isFalse) {
      agentShoppingDropOffService(true);
    } else if (index == 1 && agentShoppingDropOffService.isTrue) {
      agentShoppingDropOffService(false);
    }
  }

  void toggleSaveAsHomeAddress(int index) {
    if (index == 0 && sameAsHomeAddress.isFalse) {
      sameAsHomeAddress(true);
    } else if (index == 1 && sameAsHomeAddress.isTrue) {
      sameAsHomeAddress(false);
    }
  }
}
