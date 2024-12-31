import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/view/profile/final-checkout/final_checkout_texts.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/saved-address/widget/edit_address_bottom_sheet.dart';
import 'package:sheba_plus/view/styles.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final bool editable;
  const AddressCard({super.key, required this.address, this.editable = true});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: Styles.roundedWhite.copyWith(borderRadius: !editable ? BorderRadius.circular(0) : AppBorderRadius.circularRadius8),
      padding: const EdgeInsets.only(top: 16, right: 8, left: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !editable ? Text(FinalCheckoutTexts.deliveryAddress, style: Theme.of(context).textTheme.headlineSmall,) :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(address.title, style: Theme.of(context).textTheme.labelLarge,)),
              IconButton(onPressed: () => showEditAddressBottomSheet(context, address), icon: Icon(PhosphorIcons.pencilSimple(), color: AppColors.primary,))
            ],
          ),
          8.kH,
          Text("${ProfileScreenTexts.country} : ${address.country}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("${ProfileScreenTexts.state} : ${address.state}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("${ProfileScreenTexts.city} : ${address.city}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("${ProfileScreenTexts.zipCode} : ${address.zipCode}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("${ProfileScreenTexts.street} : ${address.street}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),)
        ],
      ),
    );
  }

  void showEditAddressBottomSheet(BuildContext context, Address address) {
    showModalBottomSheet(
      context: context,
      shape: const ContinuousRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return EditAddressBottomSheet(address: address,);
      },
    );
  }

}
