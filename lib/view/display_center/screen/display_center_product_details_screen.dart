import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/cart/cart_details.dart';
import 'package:sheba_plus/models/display_service/color.dart';
import 'package:sheba_plus/models/display_service/display_service_product.dart';
import 'package:sheba_plus/models/display_service/product_size.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/cart/controller/cart_controller.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';

import '../../../utils/utils.dart';
import '../../components/custom_header_container.dart';
import '../../components/custom_primary_button.dart';
import '../widgets/display_center_product/display_center_product_category_widget.dart';
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
  final cartController = Get.find<CartController>();

  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  ProductSize selectedProductSize = ProductSize();
  ProductColor? selectedColor;
  int quantity = 1;

  _initCall() async {
    await displayCenterServiceController.getDisplayCenterServiceProductById(
        id: widget.productId);
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  addProduct() {
    if (selectedProductSize.name == null && selectedColor == null) {
      Utils.showErrorToast(
          message:
              'Before add product into cart you have to select product size and color');
    } else {
      cartController.addProductIntoCart(
          cartDetails: CartDetails(
              product: DisplayCenterProduct(
                id: displayCenterServiceController
                    .currentDisplayServiceProduct.value.id,
                name: displayCenterServiceController
                    .currentDisplayServiceProduct.value.name,
                quantity: quantity,
                price: displayCenterServiceController
                    .currentDisplayServiceProduct.value.price,
              ),
              quantity: quantity,
              color: selectedColor,
              size: selectedProductSize),
          quantity: quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Obx(
        () => displayCenterServiceController
                .loadingDisplayCenterServiceProductById.isTrue
            ? const Center(
                child: CustomLoader(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHeaderContainer(
                    title: displayCenterServiceController
                        .currentDisplayServiceProduct.value.name,
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        DisplayCenterServiceProductCarousel(
                          carouselSliderController: carouselSliderController,
                          onCarouselChange: (index) {
                            displayCenterServiceController
                                .onCarouselChange(index);
                          },
                          totalCarouselItem: 3,
                          carouselCurrentIndex: displayCenterServiceController
                              .carouselCurrentIndex.value,
                        ),
                        10.kH,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductCategoryListWidget(
                                displayCenterProduct:
                                    displayCenterServiceController
                                        .currentDisplayServiceProduct.value,
                              ),
                              5.kH,
                              Text(
                                displayCenterServiceController
                                        .currentDisplayServiceProduct
                                        .value
                                        .name ??
                                    '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              5.kH,
                              ProductPriceWidget(
                                product: displayCenterServiceController
                                    .currentDisplayServiceProduct.value,
                              ),
                              10.kH,
                              ProductColorsSelectWidget(
                                productColorList: displayCenterServiceController
                                        .currentDisplayServiceProduct
                                        .value
                                        .colorList ??
                                    [],
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
                              10.kH,
                              ProductSizeWidget(
                                productSizeList: displayCenterServiceController
                                        .currentDisplayServiceProduct
                                        .value
                                        .sizeList ??
                                    [],
                                onTapSize: (value) {
                                  setState(() {
                                    selectedProductSize = value;
                                  });
                                },
                                selectedSize: selectedProductSize,
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
                              DisplayCenterProductSpecificationWidget(
                                activeItem: displayCenterServiceController
                                    .selectProductDetailsType.value,
                                tabItems: displayCenterServiceController
                                    .productDetailsTypeList,
                                onTap: (value) => displayCenterServiceController
                                    .selectProductDetailsType(value),
                                itemText: Utils.productDetailsSpecification(
                                    type: displayCenterServiceController
                                        .selectProductDetailsType.value,
                                    product: displayCenterServiceController
                                        .currentDisplayServiceProduct.value),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10),
                    child: Column(
                      children: [
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: CustomPrimaryButton(
                                label: 'ADD TO CART',
                                labelColor: AppColors.black,
                                onClick: () {
                                  addProduct();
                                },
                                borderColor: AppColors.black,
                                color: AppColors.white,
                              ),
                            ),
                            10.kW,
                            Expanded(
                              child: CustomPrimaryButton(
                                label: 'BUY NOW',
                                onClick: () {
                                  Utils.showErrorToast(
                                      message: 'Under Construction');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
