import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/banner/controller/banner_controller.dart';
import 'package:sheba_plus/view/category/controller/category_controller.dart';
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
  final categoryController = Get.find<CategoryController>();
  final bannerController = Get.find<BannerController>();
  Timer? _debounce;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int currentImageIndex = 0;
  bool screenLoading = false;

  _initCall() async {
    _startLoading();
    navigationController.selectedIndex(1);
    displayCenterServiceController.resetData();
    await Future.wait([
      bannerController.getAllBanners(
          bannerType: AppConstants.displayCenterBannerType),
      displayCenterServiceController.getAllDisplayCenterServiceProducts(),
      categoryController.getAllCategories(),
      categoryController.getAllSubCategories()
    ]);
    startAutoChange();
    _endLoading();
  }

  _startLoading() {
    setState(() => screenLoading = true);
  }

  _endLoading() {
    setState(() => screenLoading = false);
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

  _onRefresh() async {
    _startLoading();
    await _initCall();
    _refreshController.refreshCompleted();
    startAutoChange();
    _endLoading();
  }

  void startAutoChange() {
    if (bannerController.banners.isNotEmpty) {
      _debounce = Timer.periodic(const Duration(seconds: 5), (Timer t) {
        setState(() {
          currentImageIndex =
              (currentImageIndex + 1) % bannerController.banners.length;
        });
      });
    }
  }

  focusOnOff() {
    if (navigationController.selectedIndex.value == 2) {
      Future.delayed(Duration.zero, () {
        displayCenterServiceController.searchFocusNode.value.requestFocus();
      });
    } else {
      Future.delayed(Duration.zero, () {
        displayCenterServiceController.searchFocusNode.value.unfocus();
      });
    }
  }

  clearSearchText() {
    if (displayCenterServiceController
        .productNameSearchController.value.text.isNotEmpty) {
      displayCenterServiceController.productNameSearchController.value.clear();
      getSearchProduct();
      displayCenterServiceController.productNameSearchController.refresh();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      hasCart: true,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () {
          _onRefresh();
        },
        onLoading: () {
          _refreshController.loadComplete();
        },
        child: screenLoading
            ? const CustomLoader()
            : Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DisplayServiceHeaderWidget(
                          searchOnChange: (value) {
                            displayCenterServiceController
                                .productNameSearchController
                                .refresh();
                            getSearchProduct();
                          },
                          suffixWidget: Obx(
                            () => GestureDetector(
                              onTap: () {
                                clearSearchText();
                              },
                              child: displayCenterServiceController
                                      .productNameSearchController
                                      .value
                                      .text
                                      .isEmpty
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
                          banner: bannerController.banners.isNotEmpty
                              ? bannerController.banners[currentImageIndex]
                              : null,
                          showSearchField:
                              navigationController.selectedIndex.value == 2
                                  ? false
                                  : true,
                          searchFocusNode: displayCenterServiceController
                              .searchFocusNode.value,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    )
                                  : ProductViewWidget(
                                      productList:
                                          displayCenterServiceController
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
                          navigationController.selectedIndex(index);
                          navigationController.onChangeNavigationTap(index);
                          focusOnOff();
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
