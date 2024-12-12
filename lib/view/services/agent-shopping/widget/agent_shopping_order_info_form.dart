import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/formatters/input_formatters.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/global_texts.dart';

class AgentShoppingOrderInfoForm extends StatefulWidget {
  const AgentShoppingOrderInfoForm({super.key});

  @override
  State<AgentShoppingOrderInfoForm> createState() => _AgentShoppingOrderInfoFormState();
}

class _AgentShoppingOrderInfoFormState extends State<AgentShoppingOrderInfoForm> {
  final _formKey = GlobalKey<FormState>();
  final agentShoppingController = Get.find<AgentShoppingController>();
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: AppPaddings.allPadding16,
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWithLabel(
                controller: agentShoppingController.agentShoppingMeetingLocationController.value,
                label: AgentShoppingTexts.meetingLocation,
                hintText: AgentShoppingTexts.meetingLocationHintText,
                validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: GlobalTexts.thisFieldIsRequired,
                ),
              ),
              TextFieldWithLabel(
                readOnly: true,
                controller: agentShoppingController.agentShoppingEasternTimeController.value,
                label: AgentShoppingTexts.easternTime,
                hintText: AgentShoppingTexts.easternTimeHintText,
                suffixIcon: Icon(
                  PhosphorIcons.calendarDots(),
                  color: AppColors.primary,
                ),
                onTap: () {
                  globalController.showDateTimePicker(
                      context: context,
                      canadianTime: true,
                      onPicked: setTime,
                      initialDate: agentShoppingController.agentShoppingEasternTime.value != 0 ? DateTime.fromMillisecondsSinceEpoch(agentShoppingController.agentShoppingEasternTime.value) : null);
                },
                validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: GlobalTexts.thisFieldIsRequired,
                ),
              ),
              CustomTextField(
                readOnly: true,
                controller: agentShoppingController.agentShoppingBDTimeController.value,
                hintText: AgentShoppingTexts.bdTimeHintText,
                suffixIcon: Icon(
                  PhosphorIcons.calendarDots(),
                  color: AppColors.primary,
                ),
                validator: (value) => InputValidators.generalValidator(value: value, message: GlobalTexts.thisFieldIsRequired),
                onTap: () {
                  globalController.showDateTimePicker(
                      context: context,
                      onPicked: setTime,
                      initialDate: agentShoppingController.agentShoppingBDTime.value != 0 ? DateTime.fromMillisecondsSinceEpoch(agentShoppingController.agentShoppingBDTime.value) : null);
                },
              ),
              12.kH,
              TextFieldWithLabel(
                textInputType: TextInputType.number,
                inputFormatters: [InputFormatters.numberOnly],
                controller: agentShoppingController.agentShoppingSpendAmountController.value,
                label: AgentShoppingTexts.spendAmount,
                hintText: AgentShoppingTexts.spendAmountHintText,
                validator: (value) => InputValidators.generalValidator(value: value, message: GlobalTexts.thisFieldIsRequired),
              ),
              Obx(
                () => Text(
                  AgentShoppingTexts.prePaymentWarningMessage(maxValue: globalController.appSetting.value.maxBudget ?? 0),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.error),
                ),
              ),
              12.kH,
              Obx(() => Text(AgentShoppingTexts.serviceDuration(hourlyRates: globalController.appSetting.value.hourlyRates ?? 0))),
              12.kH,
              CustomTextField(
                controller: agentShoppingController.agentShoppingServiceDurationController.value,
                hintText: AgentShoppingTexts.serviceDurationHintText,
                textInputType: TextInputType.number,
                inputFormatters: [InputFormatters.numberOnly],
                onChange: (value) {
                  if (value != null) {
                    setTotalCost(value: value.isEmpty ? "0" : null);
                  }
                  return null;
                },
                validator: (value) => InputValidators.generalValidator(value: value, message: GlobalTexts.thisFieldIsRequired),
              ),
              12.kH,
              CustomTextField(
                controller: agentShoppingController.agentShoppingServiceTotalCostController.value,
                hintText: AgentShoppingTexts.serviceDurationCostHintText,
                suffixIcon: const SizedBox(
                  width: 100,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text("(CAD)"),
                    ),
                  ),
                ),
                validator: (value) => InputValidators.generalValidator(value: value, message: GlobalTexts.thisFieldIsRequired),
                textInputType: TextInputType.number,
                inputFormatters: [InputFormatters.numberOnly],
                onChange: (value) {
                  if (value != null) {
                    setServiceDuration(value: value.isEmpty ? "0" : null);
                  }
                  return null;
                },
              ),
              24.kH,
              CustomPrimaryButton(
                  label: GlobalTexts.next,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(Routes.partialCheckoutScreen);
                    }
                  })
            ],
          )),
    );
  }

  void setTotalCost({String? value}) {
    agentShoppingController.agentShoppingServiceTotalCostController.value.text =
        "${num.parse(value ?? agentShoppingController.agentShoppingServiceDurationController.value.text) * (globalController.appSetting.value.hourlyRates ?? 0)}";
  }

  void setServiceDuration({String? value}) {
    final hourlyRate = globalController.appSetting.value.hourlyRates ?? 0;

    if (hourlyRate > 0) {
      // Ensure hourlyRate is not zero to avoid division by zero
      agentShoppingController.agentShoppingServiceDurationController.value.text = "${num.parse(value ?? agentShoppingController.agentShoppingServiceTotalCostController.value.text) / hourlyRate}";
    } else {
      agentShoppingController.agentShoppingServiceDurationController.value.text = '0'; // Set to 0 if hourlyRate is not available
    }
  }

  void setTime(DateTime selectedDateTime, bool canadianTime) {
    agentShoppingController.agentShoppingEasternTime.value = DateFormatters.getCanadianTime(selectedDateTime).millisecondsSinceEpoch;
    agentShoppingController.agentShoppingBDTime.value = DateFormatters.getBDTime(selectedDateTime).millisecondsSinceEpoch;

    if (canadianTime) {
      agentShoppingController.agentShoppingEasternTimeController.value.text = DateFormatters.getFormattedDateTime(
        selectedDateTime: selectedDateTime,
      );
      agentShoppingController.agentShoppingBDTimeController.value.text = DateFormatters.getFormattedDateTimeInBD(
        selectedDateTime: selectedDateTime,
      );
    } else {
      agentShoppingController.agentShoppingEasternTime.value = selectedDateTime.millisecondsSinceEpoch;
      agentShoppingController.agentShoppingBDTimeController.value.text = DateFormatters.getFormattedDateTime(
        selectedDateTime: selectedDateTime,
      );
      agentShoppingController.agentShoppingEasternTimeController.value.text = DateFormatters.getFormattedDateTimeInCanada(
        selectedDateTime: selectedDateTime,
      );
    }
  }
}
