import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';

import '../../components/custom_app_bar_container_widget.dart';
import '../../components/custom_tab.dart';
import '../widgets/display_center_product/display_center_service_product_carousel.dart';
import '../widgets/display_center_product/product_colors_select_widget.dart';
import '../widgets/display_center_product/product_price_widget.dart';
import '../widgets/display_center_product/product_quantity_increment_decrement_widget.dart';
import '../widgets/display_center_product/product_size_widget.dart';

class DisplayCenterProductDetailsScreen extends StatefulWidget {
  final int productId;

  const DisplayCenterProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

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

  List<String> sizeList = ['36', '38', '40', '42', '44', '46'];
  String selectedProductSize = '';
  List<Color> productColors = [
    AppColors.black,
    AppColors.grey,
    Colors.green,
    AppColors.blue,
  ];
  Color selectedColor = Colors.white;
  int quantity = 1;

  _initCall() async {
    displayCenterServiceController.getDisplayServiceProductById(
        id: widget.productId);
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
      displayCenter: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomAppBarContainerWidget(
              title: displayCenterServiceController
                      .currentDisplayServiceProduct.value.name ??
                  '',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .8,
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
                      //TODO add dynamic category name
                      Text(
                        'Men',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      5.kH,
                      Text(
                        displayCenterServiceController
                                .currentDisplayServiceProduct.value.name ??
                            '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      5.kH,
                      Obx(
                        () => ProductPriceWidget(
                          product: displayCenterServiceController
                              .currentDisplayServiceProduct.value,
                        ),
                      ),
                      ProductColorsSelectWidget(
                        productColorList: productColors,
                        onSelectColor: (value) {
                          setState(() {
                            selectedColor = value;
                          });
                        },
                        selectedColor: selectedColor,
                      ),
                      ProductSizeWidget(
                        productSizeList: sizeList,
                        onTapSize: (value) {
                          setState(() {
                            selectedProductSize = value;
                          });
                        },
                        selectedSize: selectedProductSize,
                      ),
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
                        () => SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: CustomTab(
                              activeItem: displayCenterServiceController
                                  .selectProductDetailsType.value,
                              tabItems: displayCenterServiceController
                                  .productDetailsTypeList,
                              onTap: (value) => displayCenterServiceController
                                  .selectProductDetailsType(value),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          padding: const EdgeInsets.all(80),
                          child: Center(
                            child: Text(
                              displayCenterServiceController
                                  .selectProductDetailsType.value,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
