import 'package:get/get.dart';

class AgentShoppingTexts{
  static String agentShoppingOrderInfoHeader= "Book Agent Shopping".tr;
  static String agentShoppingOrderInfoMessage = "To begin your personalized shopping experience with our agent in Bangladesh, please complete the form below. You'll need to prepay for the agent’s time and service before the session begins. Once the payment is confirmed, your agent will assist you through a live video shopping tour, just as if you were shopping in person. Any additional fees, such as shipping or extra service charges, will be communicated to you after the shopping is complete.".tr;
  static String meetingLocation = "Where do you want to meet the agent to start your shopping session?".tr;
  static String meetingLocationHintText = "Enter meeting location".tr;
  static String easternTime = "When would you like to schedule your shopping session?".tr;
  static String easternTimeHintText = "Enter Eastern time and date".tr;
  static String bdTimeHintText = "Enter BD time and date".tr;
  static String spendAmount = "How much do you plan to spend during the shopping session?".tr;
  static String spendAmountHintText = "Enter shopping amount".tr;
  static String prePaymentWarningMessage ({required int maxValue}) => "If your shopping exceeds BDT $maxValue, in that case it is mandatory to pre pay money for shopping.".tr;
  static String serviceDuration ({required int hourlyRates}) => "How many hours of service would you like to book with the agent? (CAD $hourlyRates/hour)".tr;
  static String serviceDurationHintText = "Enter shopping hour".tr;
  static String serviceDurationCostHintText = "Enter agent fee".tr;
  static String dropOffServiceNotEnabledMessage = "Since you didn’t select a drop-off option, you will need to collect your product from our Canada office. Once your product arrives, we will notify you, and you can pick it up at your convenience.".tr;

  // shopping details
  static String shopName = "Shop Name".tr;
  static String totalItem = "Total Item".tr;
  static String itemQty = "Item Qty".tr;
  static String itemPrice = "Item Price".tr;
  static String totalItemPrice = "Total Item Price".tr;
  static String total = "Total".tr;
  static String totalShoppingCost = "Total Shopping Cost".tr;
  static String shoppingCost = "Shopping Cost".tr;
  static String tax = "TAX".tr;
  static String vat = "VAT".tr;
  static String totalExpenditure = "Total expenditure:".tr;
  static String alreadyPaid = "Already PAID".tr;
  static String existingDues = "Existing DUES".tr;
}