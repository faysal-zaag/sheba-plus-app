import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/vertical_bordered_text_container.dart';
import 'package:sheba_plus/view/profile/final-checkout/widgets/final_checkout_order_summary.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/saved-address/widget/address_card.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';

class FinalCheckoutScreen extends StatelessWidget {
  FinalCheckoutScreen({super.key});

  final agentShoppingController = Get.find<AgentShoppingController>();
  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
        body: Column(
      children: [
        const CustomHeaderContainer(title: "Final Checkout"),
        VerticalBorderedContainer(
          child: Text(
            "${ProfileScreenTexts.ticketNumber} #${notificationController.latestNotification.value.ticketNo}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        16.kH,
        AddressCard(address: agentShoppingController.dropOffAddress.value, editable: false,),
        16.kH,
        FinalCheckoutOrderSummary(shoppingDetails: agentShoppingController.shoppingDetailsList,)
      ],
    ));
  }
}
