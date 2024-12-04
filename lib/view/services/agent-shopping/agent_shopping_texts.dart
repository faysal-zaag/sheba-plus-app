import 'package:get/get.dart';

class AgentShoppingTexts{
  static String agentShoppingOrderInfoHeader= "Book Your Agent Shopping Experience".tr;
  static String agentShoppingOrderInfoMessage = "To begin your personalized shopping experience with our agent in Bangladesh, please complete the form below. You'll need to prepay for the agent’s time and service before the session begins. Once the payment is confirmed, your agent will assist you through a live video shopping tour, just as if you were shopping in person. Any additional fees, such as shipping or extra service charges, will be communicated to you after the shopping is complete.".tr;
  static String meetingLocation = "Where do you want to meet the agent to start your shopping session?".tr;
  static String meetingLocationHintText = "Enter meeting location".tr;
  static String easternTime = "When would you like to schedule your shopping session?".tr;
  static String easternTimeHintText = "Enter Eastern time and date".tr;
  static String bdTimeHintText = "Enter BD time and date".tr;
  static String spendAmount = "How much do you plan to spend during the shopping session?".tr;
  static String spendAmountHintText = "26000 (BDT)".tr;
  static String prePaymentWarningMessage ({required int maxValue}) => "If your shopping exceeds BDT $maxValue, in that case it is mandatory to pre pay money for shopping.".tr;
  static String serviceDuration ({required int hourlyRates}) => "How many hours of service would you like to book with the agent? (CAD $hourlyRates/hour)".tr;
  static String serviceDurationHintText = "3.5".tr;
  static String serviceDurationCostHintText = "17.5 CAD".tr;
}