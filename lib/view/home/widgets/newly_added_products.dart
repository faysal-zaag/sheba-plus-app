import 'package:flutter/material.dart';
import 'package:sheba_plus/data/mock_data.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/product_card.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';
import 'package:sheba_plus/view/home/widgets/navigator_icon.dart';

class NewlyAddedProducts extends StatelessWidget {
  const NewlyAddedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a ScrollController to control the horizontal scroll
    final ScrollController _controller = ScrollController();

    return Container(
      color: AppColors.background,
      padding: AppPaddings.screenPadding,
      child: Column(
        children: [
          // Header
          Row(
            children: [
              Expanded(
                child: Text(
                  HomeScreenText.newlyAddedProducts,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Row(
                children: [
                  // Left Navigator Icon
                  NavigatorIcon(
                    onPressed: () {
                      // Smooth scroll left by a fixed distance
                      _controller.animateTo(
                        _controller.offset - 200, // Scroll left by 200 pixels
                        duration: const Duration(milliseconds: 300), // Animation duration
                        curve: Curves.easeInOut, // Smooth curve for the animation
                      );
                    },
                    direction: Direction.left,
                  ),
                  // Right Navigator Icon
                  NavigatorIcon(
                    onPressed: () {
                      // Smooth scroll right by a fixed distance
                      _controller.animateTo(
                        _controller.offset + 200, // Scroll right by 200 pixels
                        duration: const Duration(milliseconds: 300), // Animation duration
                        curve: Curves.easeInOut, // Smooth curve for the animation
                      );
                    },
                    direction: Direction.right,
                  ),
                ],
              )
            ],
          ),
          // Products (Horizontal Scrolling ListView)
          SizedBox(
            height: 352, // Adjust the height of the product list
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.separated(
                controller: _controller,
                separatorBuilder: (_, index) => 16.kW,
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of products (for example, 10 products)
                itemBuilder: (context, index) {
                  return ProductCard(product: product,);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
