import 'package:flutter/material.dart';

class ProductInfoContainerWidget extends StatelessWidget {
  final int index;
  final int totalItemTitleList;
  const ProductInfoContainerWidget({super.key, required this.index, required this.totalItemTitleList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }
}
