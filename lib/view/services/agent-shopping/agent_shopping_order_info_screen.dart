import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/services/agent-shopping/widget/agent_shopping_order_info_form.dart';

class AgentShoppingOrderInfoScreen extends StatelessWidget {
  AgentShoppingOrderInfoScreen({super.key});

  final agentShoppingController = Get.find<AgentShoppingController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      resizeToAvoidBottomInset: true,
      userIcon: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPaddings.screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AgentShoppingTexts.agentShoppingOrderInfoHeader,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  16.kH,
                  MessageContainer(
                      message:
                          AgentShoppingTexts.agentShoppingOrderInfoMessage),
                ],
              ),
            ),
            const AgentShoppingOrderInfoForm(),
          ],
        ),
      ),
    );
  }
}
