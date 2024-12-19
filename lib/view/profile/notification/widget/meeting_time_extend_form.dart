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
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/services/partial_checkout_texts.dart';

class MeetingTimeExtendForm extends StatefulWidget {
  const MeetingTimeExtendForm({super.key});

  @override
  State<MeetingTimeExtendForm> createState() => _MeetingTimeExtendFormState();
}

class _MeetingTimeExtendFormState extends State<MeetingTimeExtendForm> {
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  final agentShoppingController = Get.find<AgentShoppingController>();
  final globalController = Get.find<GlobalController>();
  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              24.kH,
              Row(
                children: [
                  Expanded(
                    child: CustomPrimaryButton(
                      color: AppColors.white,
                      borderColor: AppColors.border,
                      labelColor: AppColors.black,
                      label: GlobalTexts.cancel,
                      onClick: () {
                        Get.back();
                      },
                    ),
                  ),
                  16.kW,
                  Expanded(
                    child: CustomPrimaryButton(
                      label: PartialCheckoutTexts.makePayment,
                      onClick: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
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
}
