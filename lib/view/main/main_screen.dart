import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final NavigationController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(userIcon: true,),
      body: Obx(
        () => navController.widgetOptions
            .elementAt(navController.selectedIndex.value),
      ),
    );
  }
}
