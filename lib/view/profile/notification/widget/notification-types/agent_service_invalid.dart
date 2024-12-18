import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping_rescheduiling_form.dart';

class AgentServiceInvalid extends StatelessWidget {
  final String message;

  const AgentServiceInvalid({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPaddings.allPadding16,
          child: MessageContainer(message: message),
        ),
        ShoppingRescheduleForm()
      ],
    );
  }
}
