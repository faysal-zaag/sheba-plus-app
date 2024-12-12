import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/display_service/color.dart';
import 'package:sheba_plus/models/display_service/product_size.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';

import '../../components/custom_header_container.dart';
import '../../components/custom_primary_button.dart';
import '../widgets/display_center_product/display_center_service_product_carousel.dart';
import '../widgets/display_center_product/product_colors_select_widget.dart';
import '../widgets/display_center_product/product_price_widget.dart';
import '../widgets/display_center_product/product_quantity_increment_decrement_widget.dart';
import '../widgets/display_center_product/product_size_widget.dart';
import '../widgets/display_center_product_specification_widget.dart';

class DisplayCenterProductDetailsScreen extends StatefulWidget {
  final int productId;

  const DisplayCenterProductDetailsScreen({super.key, required this.productId});

  @override
  _DisplayCenterProductDetailsScreenState createState() =>
      _DisplayCenterProductDetailsScreenState();
}

class _DisplayCenterProductDetailsScreenState
    extends State<DisplayCenterProductDetailsScreen> {
  final displayCenterServiceController =
      Get.find<DisplayCenterServiceController>();

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  ProductSize selectedProductSize = ProductSize();
  ProductColor? selectedColor;
  int quantity = 1;

  _initCall() async {
    await displayCenterServiceController.getDisplayCenterServiceProductById(
        id: widget.productId);
    // displayCenterServiceController.getDisplayServiceProductById(
    //     id: widget.productId);
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomHeaderContainer(
              title: displayCenterServiceController
                      .currentDisplayServiceProduct.value.name ??
                  '',
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Obx(
                  () => DisplayCenterServiceProductCarousel(
                    carouselSliderController: carouselSliderController,
                    onCarouselChange: (index) {
                      displayCenterServiceController.onCarouselChange(index);
                    },
                    totalCarouselItem: 3,
                    carouselCurrentIndex: displayCenterServiceController
                        .carouselCurrentIndex.value,
                  ),
                ),
                10.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Men',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      5.kH,
                      Obx(
                        () => Text(
                          displayCenterServiceController
                                  .currentDisplayServiceProduct.value.name ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      5.kH,
                      Obx(
                        () => ProductPriceWidget(
                          product: displayCenterServiceController
                              .currentDisplayServiceProduct.value,
                        ),
                      ),
                      10.kH,
                      Obx(
                        () => ProductColorsSelectWidget(
                          productColorList: displayCenterServiceController
                              .currentDisplayServiceProduct.value.colorList,
                          onSelectColor: (value) {
                            setState(() {
                              selectedColor = value;
                            });
                          },
                          selectedColor: selectedColor ??
                              ProductColor(
                                  id: 0,
                                  name: 'BLUE',
                                  code: '#FFFFFF',
                                  price: 50),
                        ),
                      ),
                      10.kH,
                      Obx(
                        () => ProductSizeWidget(
                          productSizeList: displayCenterServiceController
                              .currentDisplayServiceProduct.value.sizeList,
                          onTapSize: (value) {
                            setState(() {
                              selectedProductSize = value;
                            });
                          },
                          selectedSize: selectedProductSize,
                        ),
                      ),
                      10.kH,
                      CustomQuantityIncDecWidget(
                        height: 54,
                        width: 122,
                        largeSize: true,
                        quantity: quantity,
                        onIncrementPress: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        onDecrementPress: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Obx(
                        () => DisplayCenterProductSpecificationWidget(
                          activeItem: displayCenterServiceController
                              .selectProductDetailsType.value,
                          tabItems: displayCenterServiceController
                              .productDetailsTypeList,
                          onTap: (value) => displayCenterServiceController
                              .selectProductDetailsType(value),
                          itemText: displayCenterServiceController
                              .selectProductDetailsType.value,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
            child: Column(
              children: [
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: CustomPrimaryButton(
                        label: 'ADD TO CART',
                        labelColor: AppColors.black,
                        onClick: () {},
                        borderColor: AppColors.black,
                        color: AppColors.white,
                      ),
                    ),
                    10.kW,
                    Expanded(
                      child: CustomPrimaryButton(
                        label: 'BUY NOW',
                        onClick: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
