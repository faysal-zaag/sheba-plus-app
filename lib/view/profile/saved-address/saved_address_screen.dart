import 'package:flutter/material.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/saved-address/widget/address_card.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => AddressCard(address: Address(),),
      separatorBuilder: (_, index) => 12.kH,
      itemCount: 3,
    );
  }
}
