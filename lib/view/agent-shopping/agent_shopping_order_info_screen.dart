import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/agent-shopping/widget/agent_shopping_order_info_form.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';

class AgentShoppingOrderInfoScreen extends StatelessWidget {
  AgentShoppingOrderInfoScreen({super.key});

  final agentShoppingController = Get.find<AgentShoppingController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
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
