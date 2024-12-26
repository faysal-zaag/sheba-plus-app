import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/dashed_divider.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/profile/notification/controller/notification_controller.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class OrderStatusTracks extends StatelessWidget {
  final String orderStatus;

  const OrderStatusTracks({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    Widget buildDivider(bool isActive) => Expanded(
      child: DashedDivider(
        marginBottom: 10,
        horizontalPadding: 4.0,
        color: isActive ? AppColors.primary : AppColors.hintText,
        thickness: 2,
      ),
    );

    bool isActiveForStep(String currentStatus, List<String> activeStatuses) {
      return activeStatuses.contains(currentStatus);
    }


    List<Widget> statusIcons = [
      _buildOrderStatus(
        PhosphorIcons.buildingApartment(),
        isActiveForStep(orderStatus, [
          ORDER_STATUS.ORDER_PROCESSING.name,
          ORDER_STATUS.ON_THE_WAY_TO_TORONTO_OFFICE.name,
          ORDER_STATUS.AT_TORONTO_OFFICE.name,
          ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
          ORDER_STATUS.DELIVERED.name
        ]),
      ),
      buildDivider(isActiveForStep(orderStatus, [
        ORDER_STATUS.ORDER_PROCESSING.name,
        ORDER_STATUS.ON_THE_WAY_TO_TORONTO_OFFICE.name,
        ORDER_STATUS.AT_TORONTO_OFFICE.name,
        ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
        ORDER_STATUS.DELIVERED.name
      ])),
      _buildOrderStatus(
        PhosphorIcons.airplaneTilt(),
        isActiveForStep(orderStatus, [
          ORDER_STATUS.ON_THE_WAY_TO_TORONTO_OFFICE.name,
          ORDER_STATUS.AT_TORONTO_OFFICE.name,
          ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
          ORDER_STATUS.DELIVERED.name
        ]),
      ),
      buildDivider(isActiveForStep(orderStatus, [
        ORDER_STATUS.ON_THE_WAY_TO_TORONTO_OFFICE.name,
        ORDER_STATUS.AT_TORONTO_OFFICE.name,
        ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
        ORDER_STATUS.DELIVERED.name
      ])),
      _buildOrderStatus(
        PhosphorIcons.buildings(),
        isActiveForStep(orderStatus, [
          ORDER_STATUS.AT_TORONTO_OFFICE.name,
          ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
          ORDER_STATUS.DELIVERED.name
        ]),
      ),
      buildDivider(isActiveForStep(orderStatus, [
        ORDER_STATUS.AT_TORONTO_OFFICE.name,
        ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
        ORDER_STATUS.DELIVERED.name
      ])),
      _buildOrderStatus(
        PhosphorIcons.truckTrailer(),
        isActiveForStep(orderStatus, [
          ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
          ORDER_STATUS.DELIVERED.name
        ]),
      ),
      buildDivider(isActiveForStep(orderStatus, [
        ORDER_STATUS.ON_THE_WAY_DELIVERY.name,
        ORDER_STATUS.DELIVERED.name
      ])),
      _buildOrderStatus(
        PhosphorIcons.package(),
        isActiveForStep(orderStatus, [
          ORDER_STATUS.DELIVERED.name
        ]),
      ),
    ];

    return Container(
      color: AppColors.white,
      padding: AppPaddings.allPadding16,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: statusIcons,
          ),
          36.kH,
          _buildStatusMessage(orderStatus),
        ],
      ),
    );
  }

  Widget _buildOrderStatus(PhosphorIconData icon, bool isActive) {
    Color color = isActive ? AppColors.primary : AppColors.hintText;

    return Column(
      children: [
        Icon(icon, color: color),
        8.kH,
        Icon(
          PhosphorIcons.checkCircle(
            isActive ? PhosphorIconsStyle.fill : PhosphorIconsStyle.regular,
          ),
          color: color,
        ),
      ],
    );
  }

  Widget _buildStatusMessage(String orderStatus) {
    Map<String, String> messages = {
      ORDER_STATUS.ORDER_PROCESSING.name: ProfileScreenTexts.inDhakaOffice,
      ORDER_STATUS.ON_THE_WAY_TO_TORONTO_OFFICE.name: ProfileScreenTexts.onAir,
      ORDER_STATUS.AT_TORONTO_OFFICE.name: ProfileScreenTexts.inOffice,
      ORDER_STATUS.ON_THE_WAY_DELIVERY.name: ProfileScreenTexts.onTheWay,
      ORDER_STATUS.DELIVERED.name: ProfileScreenTexts.delivered,
    };

    String? message = messages[orderStatus];

    if (message == null) return const SizedBox.shrink();

    return MessageContainer(
      backgroundColor: AppColors.primary30,
      message: message,
      forOrderStatusMessage: orderStatus != ORDER_STATUS.DELIVERED.name,
      orderDelivered: orderStatus == ORDER_STATUS.DELIVERED.name,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
