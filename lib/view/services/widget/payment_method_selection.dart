import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/services/agent-shopping/controller/agent_shopping_controller.dart';

class PaymentMethodSelection extends StatelessWidget {
  final PaymentMethod selectedPaymentMethod;
  final Function(PaymentMethod) onChange;

  const PaymentMethodSelection(
      {super.key,
      required this.onChange,
      required this.selectedPaymentMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => onChange(PaymentMethod.td),
              child: Icon(
                selectedPaymentMethod == PaymentMethod.td
                    ? PhosphorIcons.radioButton(PhosphorIconsStyle.fill)
                    : PhosphorIcons.circle(),
                size: 20,
                color: selectedPaymentMethod == PaymentMethod.td ? AppColors.primary : AppColors.black,
              ),
            ),
            4.kW,
            Image.asset(AppImages.tdBank, width: 75,),
          ],
        ),
        16.kH,
        Row(
          children: [
            InkWell(
              onTap: () => onChange(PaymentMethod.paypal),
              child: Icon(
                selectedPaymentMethod == PaymentMethod.paypal
                    ? PhosphorIcons.radioButton(PhosphorIconsStyle.fill)
                    : PhosphorIcons.circle(),
                size: 20,
                color: selectedPaymentMethod == PaymentMethod.paypal ? AppColors.primary : AppColors.black,
              ),
            ),
            4.kW,
            Image.asset(AppImages.paypal, width: 75,),
          ],
        ),
      ],
    );
  }
}
