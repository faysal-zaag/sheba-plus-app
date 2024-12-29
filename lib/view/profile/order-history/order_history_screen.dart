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
import 'package:sheba_plus/view/profile/order-history/widget/orders_loading.dart';
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
      await orderController.getOrders(onGoing: isOnGoing);
    }
  }

  get isOnGoing => orderController.selectedOrderHistoryType.value == ProfileScreenTexts.activeOrder.tr;

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
              Obx(
                () => CustomTab(
                  activeItem: orderController.selectedOrderHistoryType.value,
                  tabItems: [ProfileScreenTexts.activeOrder, ProfileScreenTexts.allOrderHistory],
                  onTap: (value) async {
                    orderController.selectedOrderHistoryType(value);
                    if (value == ProfileScreenTexts.activeOrder.tr) {
                      await orderController.getOrders(onGoing: true);
                    } else {
                      await orderController.getOrders();
                    }
                  },
                ),
              ),
              24.kH,
              CustomSearchField(
                searchController: orderController.orderSearchController.value,
                onSearch: () async {
                  await orderController.getOrders(invoiceNo: orderController.orderSearchController.value.text);
                },
              )
            ],
          ),
        ),
        16.kH,
        Expanded(
          child: Obx(
            () => orderController.getOrdersLoading.isTrue
                ? const OrdersLoading()
                : PaginatedListview(
                    itemBuilder: (_, index) => OrderHistoryCard(
                      order: orderController.orders[index],
                      user: profileController.user.value,
                    ),
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
    return await orderController.getOrders(onGoing: isOnGoing);
  }

  Future<void> onFetchNextPage() async {
    return await orderController.getOrders(page: orderController.currentPage.value + 1);
  }
}
