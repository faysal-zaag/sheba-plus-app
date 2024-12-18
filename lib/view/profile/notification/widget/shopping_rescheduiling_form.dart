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
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/global_texts.dart';

class ShoppingRescheduleForm extends StatefulWidget {
  const ShoppingRescheduleForm({super.key});

  @override
  State<ShoppingRescheduleForm> createState() => _ShoppingRescheduleFormState();
}

class _ShoppingRescheduleFormState extends State<ShoppingRescheduleForm> {
  final _formKey = GlobalKey<FormState>();
  final notificationController = Get.find<NotificationController>();
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
                controller: notificationController.rescheduledMeetingLocationController.value,
                label: AgentShoppingTexts.meetingLocation,
                hintText: AgentShoppingTexts.meetingLocationHintText,
                validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: GlobalTexts.thisFieldIsRequired,
                ),
              ),
              TextFieldWithLabel(
                readOnly: true,
                asterisk: true,
                controller: notificationController.rescheduledEasternTimeController.value,
                label: ProfileScreenTexts.pleaseReschedule,
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
                      initialDate: notificationController.rescheduledEasternTime.value != 0 ? DateTime.fromMillisecondsSinceEpoch(notificationController.rescheduledEasternTime.value) : null);
                },
                validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: GlobalTexts.thisFieldIsRequired,
                ),
              ),
              CustomTextField(
                readOnly: true,
                controller: notificationController.rescheduledBDTimeController.value,
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
                      initialDate: notificationController.rescheduledBDTime.value != 0 ? DateTime.fromMillisecondsSinceEpoch(notificationController.rescheduledBDTime.value) : null);
                },
              ),
              24.kH,
              CustomPrimaryButton(
                  label: ProfileScreenTexts.updateSchedule,
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      //TODO: Update schedule function
                    }
                  })
            ],
          )),
    );
  }

  void setTime(DateTime selectedDateTime, bool canadianTime) {
    notificationController.rescheduledEasternTime.value = DateFormatters.getCanadianTime(selectedDateTime).millisecondsSinceEpoch;
    notificationController.rescheduledBDTime.value = DateFormatters.getBDTime(selectedDateTime).millisecondsSinceEpoch;

    if (canadianTime) {
      notificationController.rescheduledEasternTimeController.value.text = DateFormatters.getFormattedDateTime(
        selectedDateTime: selectedDateTime,
      );
      notificationController.rescheduledBDTimeController.value.text = DateFormatters.getFormattedDateTimeInBD(
        selectedDateTime: selectedDateTime,
      );
    } else {
      notificationController.rescheduledEasternTime.value = selectedDateTime.millisecondsSinceEpoch;
      notificationController.rescheduledBDTimeController.value.text = DateFormatters.getFormattedDateTime(
        selectedDateTime: selectedDateTime,
      );
      notificationController.rescheduledEasternTimeController.value.text = DateFormatters.getFormattedDateTimeInCanada(
        selectedDateTime: selectedDateTime,
      );
    }
  }
}
