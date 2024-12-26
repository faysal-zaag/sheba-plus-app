import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/order/order.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view_model/repositories/order.repository.dart';

class OrderController extends GetxController{
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository);

  final orderSearchController = TextEditingController().obs;
  final getOrdersLoading = false.obs;
  final getMoreOrdersLoading = false.obs;
  final orders = <Order>[].obs;
  final ordersAlreadyLoaded = false.obs;
  final currentPage = 0.obs;
  final totalPages = 0.obs;
  final selectedOrderHistoryType = ProfileScreenTexts.activeOrder.tr.obs;

  Future<void> getOrders({bool? onGoing, int page = 0}) async {
    try {
      // Set loading states based on the page
      if (page == 0) {
        getOrdersLoading(true);
      } else {
        currentPage(page);
        getMoreOrdersLoading(true);
      }

      // Fetch notifications from the repository
      final response = await _orderRepository.getAllOrders(onGoing: onGoing, page: page);
      final orderListData = response.data["content"] as List;

      totalPages(response.data["totalPages"]);

      // Parse notifications and update unread count
      final newOrders = orderListData.map((order) {
        return Order.fromJson(order);
      }).toList();

      // Update notifications list based on page
      if (page == 0) {
        orders(newOrders);
      } else {
        orders.addAll(newOrders);
      }
    } catch (err) {
      Log.error(err.toString());
    } finally {
      // Reset loading states
      getOrdersLoading(false);
      getMoreOrdersLoading(false);
      ordersAlreadyLoaded(true);
    }
  }

}