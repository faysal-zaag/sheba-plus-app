import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/models/product/product.model.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

import '../../display_center/widgets/display_center_product/product_quantity_increment_decrement_widget.dart';

class CartItemCard extends StatelessWidget {
  final List<ProductModel> productList;
  final int index;

  const CartItemCard({Key? key, required this.productList, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: index != 2 ? AppColors.background : Colors.transparent),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productList[index].name}',
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                5.kH,
                Text(
                  '\$ ${productList[index].price}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                5.kH,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: AppColors.neutral50,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        'Color : Purple',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    10.kW,
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColors.neutral50,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text(
                        'Size : 1.57',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/green_pencil.svg'),
                      5.kW,
                      Text(
                        'Edit Item',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.green),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomQuantityIncDecWidget(
                  onIncrementPress: () {},
                  onDecrementPress: () {},
                  quantity: 2,
                  hasTitle: false,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    color: AppColors.error,
                    PhosphorIcons.trash(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
