import 'package:flutter/material.dart';
import 'package:sheba_plus/models/display_service/display_service_product.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class ProductCard extends StatelessWidget {
  final DisplayServiceProduct product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 225,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.circularRadius8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4), // Top-left corner radius
                    topRight: Radius.circular(4), // Top-right corner radius
                  ),
                  child: Image.network(
                    product.thumbnailImage.isNotEmpty
                        ? product.thumbnailImage
                        : "https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1999&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    height: 190,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: AppPaddings.screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.kH,
                    Text(
                      "\$ ${product.price}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        if (product.discountPercentage > 0)
          Positioned(
            left: 0,
            top: 8,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              color: AppColors.error,
              child: Text(
                "${product.discountPercentage}% Sale",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.white, fontSize: 12),
              ),
            ),
          ),
      ],
    );
  }
}
