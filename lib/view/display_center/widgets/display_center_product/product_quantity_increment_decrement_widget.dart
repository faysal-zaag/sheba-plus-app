import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

import '../../../../utils/constant/app_colors.dart';

class CustomQuantityIncDecWidget extends StatelessWidget {
  final Function onIncrementPress;
  final Function onDecrementPress;
  final double? height;
  final double? width;
  final bool? largeSize;
  final int quantity;
  final bool hasTitle;

  const CustomQuantityIncDecWidget(
      {super.key,
      required this.onIncrementPress,
      required this.onDecrementPress,
      required this.quantity,
      this.height,
      this.hasTitle = true,
      this.width,
      this.largeSize = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasTitle)
          Row(
            children: [
              Text(
                'Select Quantity',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                ' *',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppColors.error),
              ),
            ],
          ),
        if (hasTitle) 10.kH,
        Container(
            width: width ?? 93,
            height: height ?? 32,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.circularRadius4,
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      onDecrementPress();
                    },
                    icon: Icon(
                      Icons.remove,
                      size: largeSize == true ? 24 : 16,
                      color:
                          quantity == 1 ? AppColors.neutral70 : AppColors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    quantity <= 9 ? "0$quantity" : quantity.toString(),
                    textAlign: TextAlign.center,
                    style: largeSize == true
                        ? Theme.of(context).textTheme.labelMedium
                        : Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      onIncrementPress();
                    },
                    icon: Icon(
                      Icons.add,
                      size: largeSize == true ? 24 : 16,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
