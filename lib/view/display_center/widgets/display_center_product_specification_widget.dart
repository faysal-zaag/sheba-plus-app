import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/extensions.dart';

import '../../../utils/constant/app_colors.dart';

class DisplayCenterProductSpecificationWidget extends StatelessWidget {
  final List<String> tabItems;
  final String activeItem;
  final String itemText;
  final Function(String) onTap;

  const DisplayCenterProductSpecificationWidget(
      {super.key,
      required this.tabItems,
      required this.activeItem,
      required this.onTap, required this.itemText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.kH,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...tabItems.mapWithIndex((index, item) {
                bool active = activeItem.contains(item);

                return GestureDetector(
                  onTap: () => onTap(item),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color:
                                active ? AppColors.primary : AppColors.divider,
                            width: active ? 2 : 1),
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: active
                                  ? AppColors.primary
                                  : AppColors.subtext),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
        10.kH,
        Container(
            padding: const EdgeInsets.all(80),
            child: Center(
              child: Text(
                itemText,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
      ],
    );
  }
}
