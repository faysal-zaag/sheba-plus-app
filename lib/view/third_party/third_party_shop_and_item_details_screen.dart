import 'package:flutter/material.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';

class ThirdPartyShopAndItemDetailsScreen extends StatelessWidget {
  const ThirdPartyShopAndItemDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Column(),
    );
  }
}
