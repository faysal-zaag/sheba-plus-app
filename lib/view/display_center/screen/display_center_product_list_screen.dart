import 'package:flutter/material.dart';

import '../../../data/mock_data.dart';
import '../../components/primary_scaffold.dart';
import '../widgets/display_service_header_widget.dart';
import '../widgets/product_view_widget.dart';

class DisplayCenterProductListScreen extends StatefulWidget {
  const DisplayCenterProductListScreen({Key? key}) : super(key: key);

  @override
  _DisplayCenterProductListScreenState createState() =>
      _DisplayCenterProductListScreenState();
}

class _DisplayCenterProductListScreenState
    extends State<DisplayCenterProductListScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return PrimaryScaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DisplayServiceHeaderWidget(),
            ProductViewWidget(
              productList: mockProductList,
              onTapProduct: (product) {},
            ),
          ],
        ),
      ),
    );
  }
}
