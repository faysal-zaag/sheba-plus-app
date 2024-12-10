import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/global_texts.dart';

class TwoOptionsRadioRow extends StatelessWidget {
  final bool selectedValue;
  final Function(int) onChanged;

  const TwoOptionsRadioRow({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () => onChanged(0),
            child: Icon(selectedValue ? PhosphorIcons.radioButton(PhosphorIconsStyle.fill) : PhosphorIcons.circle(), size: 20, color: selectedValue ? AppColors.primary : AppColors.black,)),
        4.kW,
        Text(GlobalTexts.yes, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: selectedValue ? AppColors.primary : AppColors.black)),
        20.kW,
        InkWell(
            onTap: () => onChanged(1),
            child: Icon(selectedValue ? PhosphorIcons.circle() : PhosphorIcons.radioButton(PhosphorIconsStyle.fill), size: 20, color: selectedValue ? AppColors.black : AppColors.primary,)),
        4.kW,
        Text(GlobalTexts.no, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: selectedValue ? AppColors.black : AppColors.primary),),
      ],
    );
  }
}
