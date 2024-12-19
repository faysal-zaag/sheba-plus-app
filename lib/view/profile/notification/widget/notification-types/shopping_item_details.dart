import 'package:flutter/material.dart';
import 'package:sheba_plus/models/shopping-deatils/shopping_details.dart';
import 'package:sheba_plus/view/profile/notification/widget/shopping-details/shopping_details_container.dart';
import 'package:collection/collection.dart';

class ShoppingItemDetails extends StatelessWidget {
  final List<ShoppingDetails> shoppingDetailsList;

  const ShoppingItemDetails({super.key, required this.shoppingDetailsList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...shoppingDetailsList.mapIndexed(
          (index, shoppingDetails) => Column(
            children: [
              ShoppingDetailsContainer(
                shoppingDetails: shoppingDetails,
              ),
              if (index < shoppingDetailsList.length - 1) const Divider()
            ],
          ),
        )
      ],
    );
  }
}
