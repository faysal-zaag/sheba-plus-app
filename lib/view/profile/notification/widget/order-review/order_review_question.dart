import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/two_options_radio_row.dart';

class OrderReviewQuestion extends StatelessWidget {
  final String question;
  const OrderReviewQuestion({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question, style: Theme.of(context).textTheme.titleSmall,),
        12.kH,
        TwoOptionsRadioRow(selectedValue: true, onChanged: (){}),
        24.kH,
      ],
    );
  }
}
