import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum PaymentMethod {td, paypal}

class AgentShoppingController extends GetxController{
  final agentShoppingMeetingLocationController = TextEditingController().obs;
  final agentShoppingEasternTimeController = TextEditingController().obs;
  final agentShoppingBDTimeController = TextEditingController().obs;
  final agentShoppingSpendAmountController = TextEditingController().obs;
  final agentShoppingServiceDurationController = TextEditingController().obs;
  final agentShoppingServiceTotalCostController = TextEditingController().obs;
  final agentShoppingDropOffService = true.obs;
  final sameAsHomeAddress = true.obs;
  final paymentMethod = PaymentMethod.td.obs;

  void togglePaymentMethod({required PaymentMethod method}){
    if(paymentMethod.value != PaymentMethod.td && method == PaymentMethod.td){
      paymentMethod(PaymentMethod.td);
    }
    if(paymentMethod.value == PaymentMethod.td && method != PaymentMethod.td){
      paymentMethod(PaymentMethod.paypal);
    }
  }

  void toggleDropOffService(){
    agentShoppingDropOffService(!agentShoppingDropOffService.value);
  }

  void toggleSaveAsHomeAddress(){
    sameAsHomeAddress(!sameAsHomeAddress.value);
  }
}