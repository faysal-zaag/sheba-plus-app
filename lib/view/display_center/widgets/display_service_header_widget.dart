import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/display_center/widgets/product_filtering_widget.dart';
import 'package:side_sheet/side_sheet.dart';

import '../controller/display_service_controller.dart';

class DisplayServiceHeaderWidget extends StatelessWidget {
  DisplayServiceHeaderWidget({super.key});

  final displayCenterServiceController =
      Get.find<DisplayCenterServiceController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Image.asset(
          'assets/images/sale_banner.png',
          height: height * .2,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                '${displayCenterServiceController.totalDisplayServiceProduct.value} Results',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            IconButton(
              onPressed: () {
                SideSheet.right(
                    body: const ProductFilteringWidget(),
                    context: context);
              },
              icon: const Icon(Icons.filter_list_outlined),
            ),
          ],
        ),
      ],
    );
  }
}
