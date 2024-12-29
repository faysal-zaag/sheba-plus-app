import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/models/invoice/invoice.dart';
import 'package:sheba_plus/models/order/order.dart';
import 'package:sheba_plus/models/shopping-details/shopping_details.dart';
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

  final getOrderDetailsLoading = false.obs;
  final orderDetails = const Order().obs;

  Future<void> getOrders({String? invoiceNo, bool? onGoing, int page = 0}) async {
    try {
      // Set loading states based on the page
      if (page == 0) {
        getOrdersLoading(true);
      } else {
        currentPage(page);
        getMoreOrdersLoading(true);
      }

      // Fetch notifications from the repository
      final response = await _orderRepository.getAllOrders(onGoing: onGoing, page: page, invoiceNo: invoiceNo);
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
      ordersAlreadyLoaded(true);
    } catch (err) {
      Log.error(err.toString());
    } finally {
      // Reset loading states
      getOrdersLoading(false);
      getMoreOrdersLoading(false);
    }
  }

  Future<void> getOrderDetails({required int orderId}) async {
    try {
      getOrderDetailsLoading(true);

      final response = await _orderRepository.getOrderDetails(
        orderId: orderId,
      );

      orderDetails(Order.fromJson(response.data));

    } catch (e) {
      Log.error(e.toString());
    } finally {
      getOrderDetailsLoading(false);
    }
  }

  String getOrderDetailsMessage({required String userName, required String date}){
    return "$date\n\n"
        "Hi $userName,\n\n"
        "Your shopping session with the agent has been successfully completed. "
        "To finalize your purchase, please proceed with the payment of the total shopping amount. "
        "Once the payment is confirmed, our agent will complete the purchase on your behalf. "
        "Thank you for using our service!";
  }
}