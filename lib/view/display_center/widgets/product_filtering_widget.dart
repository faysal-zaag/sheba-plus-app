import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/view/category/controller/category_controller.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';

import '../../../utils/constant/app_colors.dart';

class ProductFilteringWidget extends StatefulWidget {
  const ProductFilteringWidget({Key? key}) : super(key: key);

  @override
  _ProductFilteringWidgetState createState() => _ProductFilteringWidgetState();
}

class _ProductFilteringWidgetState extends State<ProductFilteringWidget> {
  final categoryController = Get.find<CategoryController>();

  _initCall() async {
    categoryController.getAllCategories();
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Text(
                'Filters',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.error,
                ),
              )
            ],
          ),
          const Divider(),
          Obx(
            () => categoryController.loadingAllCategories.isTrue
                ? const CustomLoader()
                : Container(),
          )
        ],
      ),
    );
  }
}
