import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/models/agent-order/agent_order.dto.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view_model/repositories/agent_shopping.repository.dart';

enum PaymentMethod { td, paypal }

class AgentShoppingController extends GetxController {
  final AgentShoppingRepository _agentShoppingRepository;
  final AddressController _addressController;
  final NotificationController _notificationController;

  AgentShoppingController(this._agentShoppingRepository, this._addressController, this._notificationController);

  final agentShoppingMeetingLocationController = TextEditingController().obs;
  final agentShoppingEasternTimeController = TextEditingController().obs;
  final agentShoppingEasternTime = 0.obs;
  final agentShoppingBDTimeController = TextEditingController().obs;
  final agentShoppingBDTime = 0.obs;
  final agentShoppingUtcTime = 0.obs;
  final agentShoppingSpendAmountController = TextEditingController().obs;
  final agentShoppingServiceDurationController = TextEditingController().obs;
  final agentShoppingServiceTotalCostController = TextEditingController().obs;
  final agentShoppingDropOffService = true.obs;
  final sameAsHomeAddress = true.obs;
  final paymentMethod = PaymentMethod.td.obs;

  final createAgentBookingLoading = false.obs;
  final updateAgentBookingScheduleLoading = false.obs;

  void resetFields() {
    agentShoppingMeetingLocationController.value.clear();
    agentShoppingEasternTimeController.value.clear();
    agentShoppingEasternTime(0);
    agentShoppingBDTimeController.value.clear();
    agentShoppingBDTime(0);
    agentShoppingUtcTime(0);
    agentShoppingSpendAmountController.value.clear();
    agentShoppingServiceDurationController.value.clear();
    agentShoppingServiceTotalCostController.value.clear();
    agentShoppingDropOffService(true);
    sameAsHomeAddress(true);
    paymentMethod(PaymentMethod.td);
  }

  void togglePaymentMethod({required PaymentMethod method}) {
    if (paymentMethod.value != PaymentMethod.td && method == PaymentMethod.td) {
      paymentMethod(PaymentMethod.td);
    }
    if (paymentMethod.value == PaymentMethod.td && method != PaymentMethod.td) {
      paymentMethod(PaymentMethod.paypal);
    }
  }

  void toggleDropOffService(int index) {
    if (index == 0 && agentShoppingDropOffService.isFalse) {
      agentShoppingDropOffService(true);
    } else if (index == 1 && agentShoppingDropOffService.isTrue) {
      agentShoppingDropOffService(false);
    }
  }

  void toggleSaveAsHomeAddress(int index) {
    if (index == 0 && sameAsHomeAddress.isFalse) {
      sameAsHomeAddress(true);
    } else if (index == 1 && sameAsHomeAddress.isTrue) {
      sameAsHomeAddress(false);
    }
  }

  Future<bool> createAgentBooking() async {
    try {
      createAgentBookingLoading(true);
      AgentOrderDTO agentOrderInfo = AgentOrderDTO(
          meetingLocations: [agentShoppingMeetingLocationController.value.text],
          dropOffService: agentShoppingDropOffService.value,
          estimatedBudget: num.parse(agentShoppingSpendAmountController.value.text),
          hourBooked: num.parse(agentShoppingServiceDurationController.value.text),
          meetingTime: agentShoppingUtcTime.value,
          deliveryAddress: sameAsHomeAddress.isTrue
              ? _addressController.addresses[0]
              : Address(
                  city: _addressController.newAddressCityController.value.text,
                  country: _addressController.newAddressSelectedCountry.value,
                  state: _addressController.newAddressSelectedState.value,
                  street: _addressController.newAddressStreetController.value.text,
                  streetAlternative: _addressController.newAddressStreet2Controller.value.text.isEmpty ? null : _addressController.newAddressStreet2Controller.value.text,
                  addressDesc: _addressController.newAddressAdditionalInfo.value.text.isEmpty ? null : _addressController.newAddressAdditionalInfo.value.text,
                  zipCode: int.parse(
                    _addressController.newAddressZipCodeController.value.text,
                  ),
                ));

      await _agentShoppingRepository.createAgentBooking(agentOrderInfo: agentOrderInfo);

      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      createAgentBookingLoading(false);
    }
  }

  Future<bool> updateAgentBookingSchedule({required int orderId}) async {
    try {
      updateAgentBookingScheduleLoading(true);

      await _agentShoppingRepository.updateAgentBookingSchedule(
        orderId: orderId,
        meetingLocations: [_notificationController.rescheduledMeetingLocationController.value.text],
        meetingTime: _notificationController.rescheduledUtcTime.value,
      );

      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      updateAgentBookingScheduleLoading(false);
    }
  }
}
