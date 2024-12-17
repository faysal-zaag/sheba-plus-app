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
  String get meetingLocation => throw _privateConstructorUsedError;
  int get easternTime => throw _privateConstructorUsedError;
  int get bdTime => throw _privateConstructorUsedError;
  int get shoppingAmount => throw _privateConstructorUsedError;
  double get shoppingHour => throw _privateConstructorUsedError;
  double get agentFee => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
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
      {String meetingLocation,
      int easternTime,
      int bdTime,
      int shoppingAmount,
      double shoppingHour,
      double agentFee,
      Address address,
      bool dropOffService});

  $AddressCopyWith<$Res> get address;
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
    Object? meetingLocation = null,
    Object? easternTime = null,
    Object? bdTime = null,
    Object? shoppingAmount = null,
    Object? shoppingHour = null,
    Object? agentFee = null,
    Object? address = null,
    Object? dropOffService = null,
  }) {
    return _then(_value.copyWith(
      meetingLocation: null == meetingLocation
          ? _value.meetingLocation
          : meetingLocation // ignore: cast_nullable_to_non_nullable
              as String,
      easternTime: null == easternTime
          ? _value.easternTime
          : easternTime // ignore: cast_nullable_to_non_nullable
              as int,
      bdTime: null == bdTime
          ? _value.bdTime
          : bdTime // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingAmount: null == shoppingAmount
          ? _value.shoppingAmount
          : shoppingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingHour: null == shoppingHour
          ? _value.shoppingHour
          : shoppingHour // ignore: cast_nullable_to_non_nullable
              as double,
      agentFee: null == agentFee
          ? _value.agentFee
          : agentFee // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
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
      {String meetingLocation,
      int easternTime,
      int bdTime,
      int shoppingAmount,
      double shoppingHour,
      double agentFee,
      Address address,
      bool dropOffService});

  @override
  $AddressCopyWith<$Res> get address;
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
    Object? meetingLocation = null,
    Object? easternTime = null,
    Object? bdTime = null,
    Object? shoppingAmount = null,
    Object? shoppingHour = null,
    Object? agentFee = null,
    Object? address = null,
    Object? dropOffService = null,
  }) {
    return _then(_$AgentOrderDTOImpl(
      meetingLocation: null == meetingLocation
          ? _value.meetingLocation
          : meetingLocation // ignore: cast_nullable_to_non_nullable
              as String,
      easternTime: null == easternTime
          ? _value.easternTime
          : easternTime // ignore: cast_nullable_to_non_nullable
              as int,
      bdTime: null == bdTime
          ? _value.bdTime
          : bdTime // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingAmount: null == shoppingAmount
          ? _value.shoppingAmount
          : shoppingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      shoppingHour: null == shoppingHour
          ? _value.shoppingHour
          : shoppingHour // ignore: cast_nullable_to_non_nullable
              as double,
      agentFee: null == agentFee
          ? _value.agentFee
          : agentFee // ignore: cast_nullable_to_non_nullable
              as double,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
      {this.meetingLocation = "",
      this.easternTime = 0,
      this.bdTime = 0,
      this.shoppingAmount = 0,
      this.shoppingHour = 0.0,
      this.agentFee = 0.0,
      this.address = const Address(),
      this.dropOffService = false});

  factory _$AgentOrderDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentOrderDTOImplFromJson(json);

  @override
  @JsonKey()
  final String meetingLocation;
  @override
  @JsonKey()
  final int easternTime;
  @override
  @JsonKey()
  final int bdTime;
  @override
  @JsonKey()
  final int shoppingAmount;
  @override
  @JsonKey()
  final double shoppingHour;
  @override
  @JsonKey()
  final double agentFee;
  @override
  @JsonKey()
  final Address address;
  @override
  @JsonKey()
  final bool dropOffService;

  @override
  String toString() {
    return 'AgentOrderDTO(meetingLocation: $meetingLocation, easternTime: $easternTime, bdTime: $bdTime, shoppingAmount: $shoppingAmount, shoppingHour: $shoppingHour, agentFee: $agentFee, address: $address, dropOffService: $dropOffService)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentOrderDTOImpl &&
            (identical(other.meetingLocation, meetingLocation) ||
                other.meetingLocation == meetingLocation) &&
            (identical(other.easternTime, easternTime) ||
                other.easternTime == easternTime) &&
            (identical(other.bdTime, bdTime) || other.bdTime == bdTime) &&
            (identical(other.shoppingAmount, shoppingAmount) ||
                other.shoppingAmount == shoppingAmount) &&
            (identical(other.shoppingHour, shoppingHour) ||
                other.shoppingHour == shoppingHour) &&
            (identical(other.agentFee, agentFee) ||
                other.agentFee == agentFee) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.dropOffService, dropOffService) ||
                other.dropOffService == dropOffService));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meetingLocation, easternTime,
      bdTime, shoppingAmount, shoppingHour, agentFee, address, dropOffService);

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
      {final String meetingLocation,
      final int easternTime,
      final int bdTime,
      final int shoppingAmount,
      final double shoppingHour,
      final double agentFee,
      final Address address,
      final bool dropOffService}) = _$AgentOrderDTOImpl;

  factory _AgentOrderDTO.fromJson(Map<String, dynamic> json) =
      _$AgentOrderDTOImpl.fromJson;

  @override
  String get meetingLocation;
  @override
  int get easternTime;
  @override
  int get bdTime;
  @override
  int get shoppingAmount;
  @override
  double get shoppingHour;
  @override
  double get agentFee;
  @override
  Address get address;
  @override
  bool get dropOffService;

  /// Create a copy of AgentOrderDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentOrderDTOImplCopyWith<_$AgentOrderDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String get street => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String zipCode,
      String country});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String street,
      String city,
      String state,
      String zipCode,
      String country});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? street = null,
    Object? city = null,
    Object? state = null,
    Object? zipCode = null,
    Object? country = null,
  }) {
    return _then(_$AddressImpl(
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {this.street = "",
      this.city = "",
      this.state = "",
      this.zipCode = "",
      this.country = ""});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey()
  final String street;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String zipCode;
  @override
  @JsonKey()
  final String country;

  @override
  String toString() {
    return 'Address(street: $street, city: $city, state: $state, zipCode: $zipCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, street, city, state, zipCode, country);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final String street,
      final String city,
      final String state,
      final String zipCode,
      final String country}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String get street;
  @override
  String get city;
  @override
  String get state;
  @override
  String get zipCode;
  @override
  String get country;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
