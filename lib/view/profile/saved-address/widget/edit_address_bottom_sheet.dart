import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/auth/register_screen/register-address/widget/register_address_form.dart';
import 'package:sheba_plus/view/components/custom_close_button.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';

class EditAddressBottomSheet extends StatefulWidget {
  final Address address;

  const EditAddressBottomSheet({super.key, required this.address});

  @override
  State<EditAddressBottomSheet> createState() => _EditAddressBottomSheetState();
}

class _EditAddressBottomSheetState extends State<EditAddressBottomSheet> {
  final addressController = Get.find<AddressController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addressController.setAddressFieldsData(address: widget.address);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    addressController.resetAddressFields();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.screenPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Edit Address",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                CustomCloseButton(
                  height: 30,
                  width: 30,
                  backgroundColor: AppColors.subtext.withOpacity(0.1),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          const Divider(color: AppColors.divider,),
          Expanded(
            child: Container(
              padding: AppPaddings.screenPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RegisterAddressForm(forUpdate: true, addressId: widget.address.id,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
