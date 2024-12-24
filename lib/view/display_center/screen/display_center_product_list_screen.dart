import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/display_center/controller/display_service_controller.dart';
import 'package:sheba_plus/view/display_center/screen/display_center_product_details_screen.dart';
import 'package:sheba_plus/view/display_center/widgets/custom_bottom_nav_bar_widget.dart';

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
  final navigationController = Get.find<NavigationController>();
  final displayCenterServiceController =
      Get.find<DisplayCenterServiceController>();
  Timer? _debounce;

  _initCall() async {
    navigationController.selectedIndex(1);
    displayCenterServiceController.getAllDisplayCenterServiceProducts();
  }

  getSearchProduct() {
    displayCenterServiceController.getAllDisplayCenterServiceProducts(
        name: displayCenterServiceController
            .productNameSearchController.value.text);
  }

  onSearchProduct() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      getSearchProduct();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   displayCenterServiceController.productNameSearchController.value.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DisplayServiceHeaderWidget(
                  searchOnChange: (value) {
                    getSearchProduct();
                  },
                  suffixWidget: GestureDetector(
                    onTap: () {
                      if (displayCenterServiceController
                          .productNameSearchController.value.text.isNotEmpty) {
                        displayCenterServiceController
                            .productNameSearchController.value
                            .clear();
                        getSearchProduct();
                        displayCenterServiceController
                            .productNameSearchController
                            .refresh();
                      }
                    },
                    child: Obx(
                      () => displayCenterServiceController
                              .productNameSearchController.value.text.isEmpty
                          ? const Icon(
                              Icons.search,
                              color: AppColors.hintText,
                            )
                          : const Icon(
                              Icons.close,
                              color: AppColors.error,
                            ),
                    ),
                  ),
                ),
                Obx(
                  () => displayCenterServiceController
                          .loadingAllDisplayCenterServiceProducts.value
                      ? const CustomLoader()
                      : displayCenterServiceController
                              .displayServiceProductList.isEmpty
                          ? Center(
                              child: Text(
                                'No list found',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            )
                          : ProductViewWidget(
                              productList: displayCenterServiceController
                                  .displayServiceProductList,
                              onTapProduct: (product) {
                                Get.toNamed(
                                    Routes
                                        .displayCenterServiceProductDetailsScreen,
                                    arguments:
                                        DisplayCenterProductDetailsScreen(
                                            productId: product.id));
                              },
                            ),
                ),
                65.kH,
              ],
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomBottomNavBarWidget(
                currentIndex: navigationController.selectedIndex.value,
                onTap: (index) {
                  setState(
                    () {
                      navigationController.selectedIndex(index);
                    },
                  );
                  navigationController.onChangeNavigationTap(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
