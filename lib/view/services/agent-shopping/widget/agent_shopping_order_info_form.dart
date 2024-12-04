import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
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
  State<AgentShoppingOrderInfoForm> createState() =>
      _AgentShoppingOrderInfoFormState();
}

class _AgentShoppingOrderInfoFormState
    extends State<AgentShoppingOrderInfoForm> {
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
            children: [
              TextFieldWithLabel(
                controller: agentShoppingController
                    .agentShoppingMeetingLocationController.value,
                label: AgentShoppingTexts.meetingLocation,
                hintText: AgentShoppingTexts.meetingLocationHintText,
                validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: GlobalTexts.thisFieldIsRequired,
                ),
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
                  _showDateTimePicker(context: context, canadianTime: true);
                },
                validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: GlobalTexts.thisFieldIsRequired,
                ),
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
                validator: (value) => InputValidators.generalValidator(
                    value: value, message: GlobalTexts.thisFieldIsRequired),
                onTap: () {
                  _showDateTimePicker(context: context);
                },
              ),
              12.kH,
              TextFieldWithLabel(
                controller: agentShoppingController
                    .agentShoppingSpendAmountController.value,
                label: AgentShoppingTexts.spendAmount,
                hintText: AgentShoppingTexts.spendAmountHintText,
                validator: (value) => InputValidators.generalValidator(
                    value: value, message: GlobalTexts.thisFieldIsRequired),
              ),
              Obx(
                () => Text(
                  AgentShoppingTexts.prePaymentWarningMessage(
                      maxValue:
                          globalController.appSetting.value.maxBudget ?? 0),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.error),
                ),
              ),
              12.kH,
              Obx(() => Text(AgentShoppingTexts.serviceDuration(
                  hourlyRates:
                      globalController.appSetting.value.hourlyRates ?? 0))),
              12.kH,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                    controller: agentShoppingController
                        .agentShoppingServiceDurationController.value,
                    hintText: AgentShoppingTexts.serviceDurationHintText,
                    textInputType: TextInputType.number,
                    inputFormatters: [InputFormatters.numberOnly],
                    onChange: (value) {
                      if (value != null) {
                        setTotalCost(value: value.isEmpty ? "0" : null);
                      }
                      return null;
                    },
                    validator: (value) => InputValidators.generalValidator(
                        value: value, message: GlobalTexts.thisFieldIsRequired),
                  )),
                  12.kW,
                  Expanded(
                    child: CustomTextField(
                      readOnly: true,
                      controller: agentShoppingController
                          .agentShoppingServiceTotalCostController.value,
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
                    ),
                  ),
                ],
              ),
              24.kH,
              CustomPrimaryButton(
                  label: GlobalTexts.next,
                  onClick: () {
                    // if (_formKey.currentState!.validate()) {}
                    Get.toNamed(Routes.partialCheckoutScreen);
                  })
            ],
          )),
    );
  }

  void setTotalCost({String? value}) {
    agentShoppingController.agentShoppingServiceTotalCostController.value.text =
        (
      num.parse(value ??
              agentShoppingController
                  .agentShoppingServiceDurationController.value.text) *
          (globalController.appSetting.value.hourlyRates ?? 0),
    ).toString();
  }

  Future<void> _showDateTimePicker(
      {required BuildContext context,
      bool canadianTime = false,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate}) async {
    DateTime now = DateTime.now();

    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? now,
      lastDate: lastDate ?? DateTime(2500),
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
        context: Get.context!,
        initialTime: TimeOfDay.fromDateTime(now),
      );

      if (pickedTime != null) {
        DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        if (canadianTime) {
          agentShoppingController.agentShoppingEasternTimeController.value
              .text = getFormattedDateTime(
            selectedDateTime: selectedDateTime,
          );
          agentShoppingController.agentShoppingBDTimeController.value.text =
              getFormattedDateTimeInBD(
            selectedDateTime: selectedDateTime,
          );
        } else {
          agentShoppingController.agentShoppingBDTimeController.value.text =
              getFormattedDateTime(
            selectedDateTime: selectedDateTime,
          );
          agentShoppingController.agentShoppingEasternTimeController.value
              .text = getFormattedDateTimeInCanada(
            selectedDateTime: selectedDateTime,
          );
        }
      }
    }
  }

  String getFormattedDateTime({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(selectedDateTime);
  }

  String getFormattedDateTimeInCanada({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat('yyyy-MM-dd hh:mm:ss a')
        .format(selectedDateTime.toUtc().add(const Duration(hours: -5)));
  }

  String getFormattedDateTimeInBD({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";

    // Define time offsets
    const Duration canadaOffset = Duration(hours: -5);
    const Duration bdOffset = Duration(hours: 6);

    // Treat selectedDateTime as being in Canada time, adjust to UTC
    DateTime utcTime = selectedDateTime.subtract(canadaOffset);

    // Convert UTC time to Bangladesh time
    DateTime bdTime = utcTime.add(bdOffset);

    // Format the BD time
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(bdTime);
  }
}
