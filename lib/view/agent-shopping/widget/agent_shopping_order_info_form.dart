import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/styles.dart';

class AgentShoppingOrderInfoForm extends StatefulWidget {
  const AgentShoppingOrderInfoForm({super.key});

  @override
  State<AgentShoppingOrderInfoForm> createState() =>
      _AgentShoppingOrderInfoFormState();
}

class _AgentShoppingOrderInfoFormState
    extends State<AgentShoppingOrderInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final agentShoppingController = Get.find<AgentShoppingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: AppPaddings.allPadding16,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldWithLabel(
                controller: agentShoppingController
                    .agentShoppingMeetingLocationController.value,
                label: AgentShoppingTexts.meetingLocation,
                hintText: AgentShoppingTexts.meetingLocationHintText,
              ),
              TextFieldWithLabel(
                readOnly: true,
                controller: agentShoppingController
                    .agentShoppingEasternTimeController.value,
                label: AgentShoppingTexts.easternTime,
                hintText: AgentShoppingTexts.easternTimeHintText,
                suffixIcon: Icon(
                  PhosphorIcons.calendarDots(),
                  color: AppColors.primary,
                ),
                onTap: () {
                  _showDateTimePicker(canadianTime: true);
                },
              ),
              CustomTextField(
                readOnly: true,
                controller:
                    agentShoppingController.agentShoppingBDTimeController.value,
                hintText: AgentShoppingTexts.bdTimeHintText,
                suffixIcon: Icon(
                  PhosphorIcons.calendarDots(),
                  color: AppColors.primary,
                ),
                onTap: () {
                  _showDateTimePicker();
                },
              ),
              12.kH,
              TextFieldWithLabel(
                controller: agentShoppingController
                    .agentShoppingSpendAmountController.value,
                label: AgentShoppingTexts.spendAmount,
                hintText: AgentShoppingTexts.spendAmountHintText,
              ),
              Text(
                AgentShoppingTexts.prePaymentWarningMessage,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.error),
              ),
              12.kH,
              TextFieldWithLabel(
                controller: agentShoppingController
                    .agentShoppingEasternTimeController.value,
                label: AgentShoppingTexts.serviceDuration,
                hintText: AgentShoppingTexts.serviceDurationHintText,
              ),
              CustomTextField(
                controller:
                    agentShoppingController.agentShoppingBDTimeController.value,
                hintText: AgentShoppingTexts.serviceDurationCostHintText,
              ),
              24.kH,
              CustomPrimaryButton(label: "Next", onClick: () {})
            ],
          )),
    );
  }

  Future<void> _showDateTimePicker({bool canadianTime = false}) async {
    DateTime now = DateTime.now();
    const Duration bdOffset = Duration(hours: 6);  // UTC+6 for Bangladesh
    const Duration canadaOffset = Duration(hours: -5); // UTC-5 for Canada Eastern Time

    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Show Time Picker
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(now),
      );

      if (pickedTime != null) {
        agentShoppingController.agentShoppingEasternTimeController.value.text = getFormattedDateTime(
          selectedDateTime: DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          ),
        );
      }
    }
  }

  String getFormattedDateTime({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDateTime);
  }
}
