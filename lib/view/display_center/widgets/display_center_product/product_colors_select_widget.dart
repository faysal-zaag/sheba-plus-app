import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

import '../../../../utils/constant/app_colors.dart';

class ProductColorsSelectWidget extends StatelessWidget {
  final List<Color> productColorList;
  final Function onSelectColor;
  final Color selectedColor;

  const ProductColorsSelectWidget(
      {Key? key,
      required this.productColorList,
      required this.onSelectColor,
      required this.selectedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Select Color',
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
          10.kH,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            itemCount: productColorList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onSelectColor(productColorList[index]);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: productColorList[index],
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: productColorList[index] == selectedColor
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
