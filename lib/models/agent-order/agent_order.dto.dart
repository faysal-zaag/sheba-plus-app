import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_order.dto.freezed.dart';
part 'agent_order.dto.g.dart';

@freezed
class AgentOrderDTO with _$AgentOrderDTO {
  const factory AgentOrderDTO({
    @Default("") String meetingLocation,
    @Default(0) int easternTime,
    @Default(0) int bdTime,
    @Default(0) int shoppingAmount,
    @Default(0.0) double shoppingHour,
    @Default(0.0) double agentFee,
    @Default(Address()) Address address,
    @Default(false) bool dropOffService,
  }) = _AgentOrderDTO;

  factory AgentOrderDTO.fromJson(Map<String, dynamic> json) => _$AgentOrderDTOFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @Default("") String street,
    @Default("") String city,
    @Default("") String state,
    @Default("") String zipCode,
    @Default("") String country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
