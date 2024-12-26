import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/display_center/widgets/product_filtering_widget.dart';
import 'package:side_sheet/side_sheet.dart';

import '../../../models/banner/banner.dart' as banner_model;
import '../controller/display_service_controller.dart';

class DisplayServiceHeaderWidget extends StatelessWidget {
  final Function searchOnChange;
  final Widget suffixWidget;
  final banner_model.Banner banner;
  final bool showSearchField;
  final FocusNode searchFocusNode;

  DisplayServiceHeaderWidget({
    super.key,
    required this.searchOnChange,
    required this.suffixWidget,
    required this.banner, required this.showSearchField, required this.searchFocusNode,
  });

  final displayCenterServiceController =
      Get.find<DisplayCenterServiceController>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        if(showSearchField)...[ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(
            // 'assets/images/sale_banner.png',
            banner.image ?? '',
            height: height * .2,
            fit: BoxFit.fill,
          ),
        ),
          10.kH,],

        Obx(() => GestureDetector(
              onTap: () {
                searchFocusNode.unfocus();
              },
              child: CustomTextField(
                controller: displayCenterServiceController
                    .productNameSearchController.value,
                hintText: 'Search by product name',
                onChange: (value) {
                  searchOnChange(value);
                },
                suffixIcon: suffixWidget,
                focusNode: searchFocusNode,
              ),
            )),
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
                    body: const ProductFilteringWidget(), context: context);
              },
              icon: Row(
                children: [
                  const Icon(Icons.filter_list_outlined),
                  2.kW,
                  Text(
                    'Filters',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
