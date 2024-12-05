import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/extensions.dart';

class CustomTab extends StatelessWidget {
  final List<String> tabItems;
  final String activeItem;
  final Function(String) onTap;

  const CustomTab(
      {super.key,
      required this.activeItem,
      required this.tabItems,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...tabItems.mapWithIndex((index, item) {
          bool active = activeItem.contains(item);

          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(item),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: active ? AppColors.primary : AppColors.divider,
                            width: active ? 2 : 1))),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: active ? AppColors.primary : AppColors.subtext),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
