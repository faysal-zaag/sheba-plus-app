import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/styles.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  const AddressCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: Styles.roundedWhite,
      padding: const EdgeInsets.only(top: 16, right: 8, left: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(address.title, style: Theme.of(context).textTheme.labelLarge,)),
              IconButton(onPressed: (){}, icon: Icon(PhosphorIcons.pencilSimple()))
            ],
          ),
          8.kH,
          Text("Country : ${address.country}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("State : ${address.state}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("City : ${address.city}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("Zip Code : ${address.zipCode}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),),
          8.kH,
          Text("Street : ${address.street}", style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.hintText),)
        ],
      ),
    );
  }
}
