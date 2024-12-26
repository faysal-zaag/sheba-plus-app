import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/custom_search_field.dart';
import 'package:sheba_plus/view/components/custom_tab.dart';
import 'package:sheba_plus/view/components/paginated_listview.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/order-history/controller/order_controller.dart';
import 'package:sheba_plus/view/profile/order-history/widget/order_history_card.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final orderController = Get.find<OrderController>();
  final profileController = Get.find<ProfileController>();

  void _initCall() async {
    if (orderController.ordersAlreadyLoaded.isFalse) {
      await orderController.getOrders();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initCall();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: AppPaddings.screenPadding,
          decoration: Styles.roundedWhite,
          child: Column(
            children: [
              Obx(() => CustomTab(
                  activeItem: orderController.selectedOrderHistoryType.value,
                  tabItems: [ProfileScreenTexts.activeOrder, ProfileScreenTexts.allOrderHistory],
                  onTap: (value) => orderController.selectedOrderHistoryType(value))),
              24.kH,
              CustomSearchField(searchController: orderController.orderSearchController.value)
            ],
          ),
        ),
        16.kH,
        Expanded(
          child: Obx(
            () => orderController.getOrdersLoading.isTrue
                ? const Center(
                    child: CustomLoader(),
                  )
                : PaginatedListview(
                    itemBuilder: (_, index) => const OrderHistoryCard(),
                    itemCount: orderController.orders.length,
                    onRefresh: onRefresh,
                    onFetchNextPage: onFetchNextPage,
                    fetchingMoreDataLoading: orderController.getMoreOrdersLoading.value,
                    totalPages: orderController.totalPages.value,
                    noDataMessage: "No orders found",
                    currentPage: orderController.currentPage.value,
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> onRefresh() async {
    return await orderController.getOrders();
  }

  Future<void> onFetchNextPage() async {
    return await orderController.getOrders(page: orderController.currentPage.value + 1);
  }
}
