import 'package:flutter/material.dart';
import 'package:sheba_plus/models/display_service/product_size.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

import '../../../../utils/constant/app_colors.dart';

class ProductSizeWidget extends StatelessWidget {
  final List<ProductSize> productSizeList;
  final Function onTapSize;
  final ProductSize selectedSize;

  const ProductSizeWidget(
      {super.key,
      required this.productSizeList,
      required this.onTapSize,
      required this.selectedSize});

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
                'Select Size',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
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
              crossAxisCount: 5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1,
            ),
            itemCount: productSizeList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onTapSize(productSizeList[index]);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    border: Border.all(
                      color: productSizeList[index] == selectedSize
                          ? Theme.of(context).primaryColor
                          : AppColors.neutral70,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      productSizeList[index].name ?? ''
                          '',
                      style: Theme.of(context).textTheme.labelMedium,
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
