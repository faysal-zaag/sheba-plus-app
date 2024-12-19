import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/category/controller/category_controller.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';

import '../../../utils/constant/app_colors.dart';

class ProductFilteringWidget extends StatefulWidget {
  const ProductFilteringWidget({Key? key}) : super(key: key);

  @override
  _ProductFilteringWidgetState createState() => _ProductFilteringWidgetState();
}

class _ProductFilteringWidgetState extends State<ProductFilteringWidget> {
  final categoryController = Get.find<CategoryController>();

  //=======================
  double _startValue = 0.00;
  double _endValue = 10000.00;
  final TextEditingController minPriceEditingController =
      TextEditingController();
  final TextEditingController maxPriceEditingController =
      TextEditingController();

  //=======================

  _initCall() async {
    categoryController.getAllCategories();
    categoryController.getAllSubCategories();
    categoryController.resetData();
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
          Obx(
            () => categoryController.loadingAllCategories.isTrue
                ? const CustomLoader()
                : Expanded(
                    child: ListView(
                      children: [
                        ExpansionTile(
                          shape: Border.all(color: AppColors.neutral65),
                          iconColor: AppColors.black,
                          title: Text(
                            'Categories${categoryController.categoryIds.isNotEmpty ? ' (${categoryController.categoryIds.length})' : ''}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          children: [
                            ...List.generate(
                              categoryController.showAllCategories.isTrue
                                  ? categoryController.allCategories.length
                                  : 2,
                              (index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                          if (categoryController.categoryIds
                                              .contains(categoryController
                                                  .allCategories[index].id)) {
                                            categoryController.categoryIds
                                                .remove(categoryController
                                                    .allCategories[index].id);
                                          } else {
                                            categoryController.categoryIds.add(
                                                categoryController
                                                    .allCategories[index].id);
                                          }
                                      },
                                      icon: Icon(
                                        categoryController.categoryIds.contains(
                                                categoryController
                                                    .allCategories[index].id)
                                            ? PhosphorIcons.checkSquare(
                                          PhosphorIconsStyle.fill
                                        )
                                            : PhosphorIcons.square(),
                                        color: categoryController.categoryIds.contains(
                                            categoryController
                                                .allCategories[index].id)
                                            ? AppColors.primary
                                            : AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      categoryController
                                          .allCategories[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                );
                              },
                            ),
                            if (categoryController.allCategories.length > 2)
                              ListTile(
                                title: Text(
                                  categoryController.showAllCategories.value
                                      ? 'Show less'
                                      : '+ View more',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                onTap: () {
                                  categoryController.showAllCategories.value =
                                      !categoryController
                                          .showAllCategories.value;
                                },
                              ),
                          ],
                        ),
                        ExpansionTile(
                          shape: Border.all(color: AppColors.neutral65),
                          iconColor: AppColors.black,
                          title: Text(
                            'Sub Categories${categoryController.subCategoryIds.isNotEmpty ? ' (${categoryController.subCategoryIds.length})' : ''}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          children: [
                            ...List.generate(
                                categoryController.showAllSubCategories.isTrue
                                    ? categoryController.allSubCategories.length
                                    : 2, (index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                        if (categoryController.subCategoryIds
                                            .contains(categoryController
                                                .allSubCategories[index].id)) {
                                          categoryController.subCategoryIds
                                              .remove(categoryController
                                                  .allSubCategories[index].id);
                                        } else {
                                          categoryController.subCategoryIds.add(
                                              categoryController
                                                  .allSubCategories[index].id);
                                        }
                                    },
                                    icon: Icon(
                                      categoryController.subCategoryIds
                                              .contains(categoryController
                                                  .allSubCategories[index].id)
                                          ? PhosphorIcons.checkSquare(
                                              PhosphorIconsStyle.fill)
                                          : PhosphorIcons.square(),
                                      color: categoryController.subCategoryIds
                                              .contains(categoryController
                                                  .allSubCategories[index].id)
                                          ? AppColors.primary
                                          : AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    categoryController
                                        .allSubCategories[index].name,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              );
                            }),
                            ListTile(
                              title: Text(
                                categoryController.showAllSubCategories.value
                                    ? 'Show less'
                                    : '+ View more',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              onTap: () {
                                categoryController.showAllSubCategories.value =
                                    !categoryController
                                        .showAllSubCategories.value;
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          shape: Border.all(color: AppColors.neutral65),
                          iconColor: AppColors.black,
                          title: Text(
                            'Availability${categoryController.selectProductAvailability.value != "" ? '(1)' : ''}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          children: [
                            ...List.generate(
                                categoryController.productAvailability.length,
                                (index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      categoryController
                                          .selectProductAvailability(
                                              categoryController
                                                  .productAvailability[index]);
                                    },
                                    icon: Icon(
                                      categoryController
                                                  .selectProductAvailability
                                                  .value ==
                                              categoryController
                                                  .productAvailability[index]
                                          ? PhosphorIcons.checkSquare(
                                              PhosphorIconsStyle.fill)
                                          : PhosphorIcons.square(),
                                      color: categoryController
                                                  .selectProductAvailability
                                                  .value ==
                                              categoryController
                                                  .productAvailability[index]
                                          ? AppColors.primary
                                          : AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    categoryController
                                        .productAvailability[index],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                        ExpansionTile(
                          shape: Border.all(color: AppColors.neutral65),
                          title: Text(
                            'Sort by',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          children: [
                            ...List.generate(
                                categoryController.productSortByItems.length,
                                (index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      PhosphorIcons.square(),
                                    ),
                                  ),
                                  Text(
                                    categoryController
                                        .productSortByItems[index],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                        ExpansionTile(
                          shape: Border.all(color: AppColors.neutral65),
                          iconColor: AppColors.black,
                          title: Text(
                            'Price',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          children: [
                            RangeSlider(
                              activeColor: AppColors.primary,
                              min: 0.00,
                              max: 99999.00,
                              values: RangeValues(_startValue, _endValue),
                              onChanged: (values) {
                                setState(() {
                                  _startValue = values.start;
                                  _endValue = values.end;
                                  minPriceEditingController.text =
                                      '\$ ${_startValue.toStringAsFixed(2)}';
                                  maxPriceEditingController.text =
                                      '\$ ${_endValue.toStringAsFixed(2)}';
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      controller: minPriceEditingController,
                                      textInputType: TextInputType.number,
                                    ),
                                  ),
                                  15.kW,
                                  Expanded(
                                    child: CustomTextField(
                                        controller: maxPriceEditingController,
                                        textInputType: TextInputType.number),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (Utils.isKeyboardOpen(context)) 350.kH,
                      ],
                    ),
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: CustomPrimaryButton(
                    label: 'Reset ()',
                    onClick: () {
                      categoryController.resetData();
                    },
                    color: AppColors.primary30,
                    borderColor: AppColors.border,
                    labelColor: AppColors.blackTitle,
                  ),
                ),
                20.kW,
                Expanded(
                  child: CustomPrimaryButton(
                    label: 'Apply',
                    onClick: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
