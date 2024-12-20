import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/navigation_controller.dart';
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

  _initCall() async {
    navigationController.selectedIndex(1);
    displayCenterServiceController.getAllDisplayCenterServiceProducts();
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DisplayServiceHeaderWidget(),
                Obx(
                  () => displayCenterServiceController
                          .loadingAllDisplayCenterServiceProducts.value
                      ? const CustomLoader()
                      : ProductViewWidget(
                          productList: displayCenterServiceController
                              .displayServiceProductList,
                          onTapProduct: (product) {
                            Get.toNamed(
                                Routes.displayCenterServiceProductDetailsScreen,
                                arguments: DisplayCenterProductDetailsScreen(
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
