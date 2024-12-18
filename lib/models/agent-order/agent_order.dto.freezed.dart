// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_order.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentOrderDTO _$AgentOrderDTOFromJson(Map<String, dynamic> json) {
  return _AgentOrderDTO.fromJson(json);
}

/// @nodoc
mixin _$AgentOrderDTO {
  List<String> get meetingLocations => throw _privateConstructorUsedError;
  num get meetingTime => throw _privateConstructorUsedError;
  num get estimatedBudget => throw _privateConstructorUsedError;
  num get hourBooked => throw _privateConstructorUsedError;
  Address get deliveryAddress => throw _privateConstructorUsedError;
  bool get dropOffService => throw _privateConstructorUsedError;

  /// Serializes this AgentOrderDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentOrderDTOCopyWith<AgentOrderDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentOrderDTOCopyWith<$Res> {
  factory $AgentOrderDTOCopyWith(
          AgentOrderDTO value, $Res Function(AgentOrderDTO) then) =
      _$AgentOrderDTOCopyWithImpl<$Res, AgentOrderDTO>;
  @useResult
  $Res call(
      {List<String> meetingLocations,
      num meetingTime,
      num estimatedBudget,
      num hourBooked,
      Address deliveryAddress,
      bool dropOffService});

  $AddressCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class _$AgentOrderDTOCopyWithImpl<$Res, $Val extends AgentOrderDTO>
    implements $AgentOrderDTOCopyWith<$Res> {
  _$AgentOrderDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meetingLocations = null,
    Object? meetingTime = null,
    Object? estimatedBudget = null,
    Object? hourBooked = null,
    Object? deliveryAddress = null,
    Object? dropOffService = null,
  }) {
    return _then(_value.copyWith(
      meetingLocations: null == meetingLocations
          ? _value.meetingLocations
          : meetingLocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      meetingTime: null == meetingTime
          ? _value.meetingTime
          : meetingTime // ignore: cast_nullable_to_non_nullable
              as num,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as num,
      hourBooked: null == hourBooked
          ? _value.hourBooked
          : hourBooked // ignore: cast_nullable_to_non_nullable
              as num,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      dropOffService: null == dropOffService
          ? _value.dropOffService
          : dropOffService // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get deliveryAddress {
    return $AddressCopyWith<$Res>(_value.deliveryAddress, (value) {
      return _then(_value.copyWith(deliveryAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgentOrderDTOImplCopyWith<$Res>
    implements $AgentOrderDTOCopyWith<$Res> {
  factory _$$AgentOrderDTOImplCopyWith(
          _$AgentOrderDTOImpl value, $Res Function(_$AgentOrderDTOImpl) then) =
      __$$AgentOrderDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> meetingLocations,
      num meetingTime,
      num estimatedBudget,
      num hourBooked,
      Address deliveryAddress,
      bool dropOffService});

  @override
  $AddressCopyWith<$Res> get deliveryAddress;
}

/// @nodoc
class __$$AgentOrderDTOImplCopyWithImpl<$Res>
    extends _$AgentOrderDTOCopyWithImpl<$Res, _$AgentOrderDTOImpl>
    implements _$$AgentOrderDTOImplCopyWith<$Res> {
  __$$AgentOrderDTOImplCopyWithImpl(
      _$AgentOrderDTOImpl _value, $Res Function(_$AgentOrderDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meetingLocations = null,
    Object? meetingTime = null,
    Object? estimatedBudget = null,
    Object? hourBooked = null,
    Object? deliveryAddress = null,
    Object? dropOffService = null,
  }) {
    return _then(_$AgentOrderDTOImpl(
      meetingLocations: null == meetingLocations
          ? _value._meetingLocations
          : meetingLocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      meetingTime: null == meetingTime
          ? _value.meetingTime
          : meetingTime // ignore: cast_nullable_to_non_nullable
              as num,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as num,
      hourBooked: null == hourBooked
          ? _value.hourBooked
          : hourBooked // ignore: cast_nullable_to_non_nullable
              as num,
      deliveryAddress: null == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      dropOffService: null == dropOffService
          ? _value.dropOffService
          : dropOffService // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentOrderDTOImpl implements _AgentOrderDTO {
  const _$AgentOrderDTOImpl(
      {final List<String> meetingLocations = const [],
      this.meetingTime = 0,
      this.estimatedBudget = 0,
      this.hourBooked = 0,
      this.deliveryAddress = const Address(),
      this.dropOffService = false})
      : _meetingLocations = meetingLocations;

  factory _$AgentOrderDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentOrderDTOImplFromJson(json);

  final List<String> _meetingLocations;
  @override
  @JsonKey()
  List<String> get meetingLocations {
    if (_meetingLocations is EqualUnmodifiableListView)
      return _meetingLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meetingLocations);
  }

  @override
  @JsonKey()
  final num meetingTime;
  @override
  @JsonKey()
  final num estimatedBudget;
  @override
  @JsonKey()
  final num hourBooked;
  @override
  @JsonKey()
  final Address deliveryAddress;
  @override
  @JsonKey()
  final bool dropOffService;

  @override
  String toString() {
    return 'AgentOrderDTO(meetingLocations: $meetingLocations, meetingTime: $meetingTime, estimatedBudget: $estimatedBudget, hourBooked: $hourBooked, deliveryAddress: $deliveryAddress, dropOffService: $dropOffService)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentOrderDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._meetingLocations, _meetingLocations) &&
            (identical(other.meetingTime, meetingTime) ||
                other.meetingTime == meetingTime) &&
            (identical(other.estimatedBudget, estimatedBudget) ||
                other.estimatedBudget == estimatedBudget) &&
            (identical(other.hourBooked, hourBooked) ||
                other.hourBooked == hourBooked) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.dropOffService, dropOffService) ||
                other.dropOffService == dropOffService));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_meetingLocations),
      meetingTime,
      estimatedBudget,
      hourBooked,
      deliveryAddress,
      dropOffService);

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentOrderDTOImplCopyWith<_$AgentOrderDTOImpl> get copyWith =>
      __$$AgentOrderDTOImplCopyWithImpl<_$AgentOrderDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentOrderDTOImplToJson(
      this,
    );
  }
}

abstract class _AgentOrderDTO implements AgentOrderDTO {
  const factory _AgentOrderDTO(
      {final List<String> meetingLocations,
      final num meetingTime,
      final num estimatedBudget,
      final num hourBooked,
      final Address deliveryAddress,
      final bool dropOffService}) = _$AgentOrderDTOImpl;

  factory _AgentOrderDTO.fromJson(Map<String, dynamic> json) =
      _$AgentOrderDTOImpl.fromJson;

  @override
  List<String> get meetingLocations;
  @override
  num get meetingTime;
  @override
  num get estimatedBudget;
  @override
  num get hourBooked;
  @override
  Address get deliveryAddress;
  @override
  bool get dropOffService;

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentOrderDTOImplCopyWith<_$AgentOrderDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
