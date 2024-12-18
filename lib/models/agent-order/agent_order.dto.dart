import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_plus/models/address/address.dart';

part 'agent_order.dto.freezed.dart';
part 'agent_order.dto.g.dart';

@freezed
class AgentOrderDTO with _$AgentOrderDTO {
  const factory AgentOrderDTO({
    @Default([]) List<String> meetingLocations,
    @Default(0) num meetingTime,
    @Default(0) num estimatedBudget,
    @Default(0) num hourBooked,
    @Default(Address()) Address deliveryAddress,
    @Default(false) bool dropOffService,
  }) = _AgentOrderDTO;

  factory AgentOrderDTO.fromJson(Map<String, dynamic> json) => _$AgentOrderDTOFromJson(json);
}