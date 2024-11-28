import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController searchController;
  const CustomSearchField({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(textEditingController: searchController, suffixIcon: Icon(PhosphorIcons.magnifyingGlass(), color: AppColors.paragraph,), hintText: ProfileScreenTexts.searchByTickerNumber,);
  }
}
