import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/auth/register_screen/register-address/widget/register_address_form.dart';
import 'package:sheba_plus/view/auth/register_screen/register-address/widget/register_new_address_form.dart';
import 'package:sheba_plus/view/components/custom_header_container.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/two_options_radio_row.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/agent_shopping_texts.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';
import 'package:sheba_plus/view/services/partial_checkout_texts.dart';
import 'package:sheba_plus/view/services/widget/order_summary.dart';
import 'package:sheba_plus/view/services/widget/payment_method_selection.dart';
import 'package:sheba_plus/view/styles.dart';

class PartialCheckoutScreen extends StatelessWidget {
  PartialCheckoutScreen({super.key});

  final agentShoppingController = Get.find<AgentShoppingController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      resizeToAvoidBottomInset: true,
      userIcon: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeaderContainer(
            title: PartialCheckoutTexts.partialCheckoutScreenHeader,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: AppPaddings.allPadding16,
                  child: MessageContainer(
                    message: PartialCheckoutTexts.partialCheckoutScreenMessage,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: AppPaddings.screenPadding,
                  decoration: Styles.roundedWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        PartialCheckoutTexts.dropOffServiceTitle,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      8.kH,
                      Text(
                        PartialCheckoutTexts.dropOffServiceDescription,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),
                      ),
                      24.kH,
                      Obx(
                        () => TwoOptionsRadioRow(
                          selectedValue: agentShoppingController.agentShoppingDropOffService.value,
                          onChanged: agentShoppingController.toggleDropOffService,
                        ),
                      ),
                    ],
                  ),
                ),
                16.kH,
                // ask if the delivery address is same as home address if user want drop off service
                Padding(
                    padding: AppPaddings.horizontal16,
                    child: Obx(
                      () => agentShoppingController.agentShoppingDropOffService.isTrue
                          ? Column(
                              children: [
                                Text(PartialCheckoutTexts.isSameAsHomeAddress, style: Theme.of(context).textTheme.labelLarge),
                                24.kH,
                                Obx(
                                  () => TwoOptionsRadioRow(
                                    selectedValue: agentShoppingController.sameAsHomeAddress.value,
                                    onChanged: agentShoppingController.toggleSaveAsHomeAddress,
                                  ),
                                ),
                              ],
                            )
                          : MessageContainer(
                              message: AgentShoppingTexts.dropOffServiceNotEnabledMessage,
                              backgroundColor: AppColors.primary25,
                              borderColor: AppColors.primary50,
                            ),
                    )),
                Obx(
                  () => agentShoppingController.sameAsHomeAddress.isFalse
                      ? Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          color: AppColors.white,
                          padding: AppPaddings.screenPadding,
                          child: RegisterNewAddressForm(
                            formKey: formKey,
                          ),
                        )
                      : const SizedBox(),
                ),
                16.kH,
                OrderSummary(),
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        HomeScreenText.paymentMethod,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      16.kH,
                      Obx(
                        () => PaymentMethodSelection(
                            onChange: (method) => agentShoppingController.togglePaymentMethod(method: method), selectedPaymentMethod: agentShoppingController.paymentMethod.value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: AppPaddings.allPadding16,
        child: CustomPrimaryButton(
            label: PartialCheckoutTexts.makePaymentAndConfirm,
            onClick: () {
              if (agentShoppingController.sameAsHomeAddress.isFalse) {
                if (formKey.currentState!.validate()) {
                  print("Valid form");
                }
              }
            }),
      ),
    );
  }
}
