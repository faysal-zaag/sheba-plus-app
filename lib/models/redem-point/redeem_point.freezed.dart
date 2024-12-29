// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RedeemPoint _$RedeemPointFromJson(Map<String, dynamic> json) {
  return _RedeemPoint.fromJson(json);
}

/// @nodoc
mixin _$RedeemPoint {
  int get createdAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get redeemPointAction => throw _privateConstructorUsedError;
  String get redeemedBy => throw _privateConstructorUsedError;
  String? get invoiceNumber => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  User get customer => throw _privateConstructorUsedError;
  User? get referredBy => throw _privateConstructorUsedError;
  User? get referredTo => throw _privateConstructorUsedError;

  /// Serializes this RedeemPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RedeemPointCopyWith<RedeemPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemPointCopyWith<$Res> {
  factory $RedeemPointCopyWith(
          RedeemPoint value, $Res Function(RedeemPoint) then) =
      _$RedeemPointCopyWithImpl<$Res, RedeemPoint>;
  @useResult
  $Res call(
      {int createdAt,
      int id,
      String redeemPointAction,
      String redeemedBy,
      String? invoiceNumber,
      int point,
      User customer,
      User? referredBy,
      User? referredTo});

  $UserCopyWith<$Res> get customer;
  $UserCopyWith<$Res>? get referredBy;
  $UserCopyWith<$Res>? get referredTo;
}

/// @nodoc
class _$RedeemPointCopyWithImpl<$Res, $Val extends RedeemPoint>
    implements $RedeemPointCopyWith<$Res> {
  _$RedeemPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? redeemPointAction = null,
    Object? redeemedBy = null,
    Object? invoiceNumber = freezed,
    Object? point = null,
    Object? customer = null,
    Object? referredBy = freezed,
    Object? referredTo = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      redeemPointAction: null == redeemPointAction
          ? _value.redeemPointAction
          : redeemPointAction // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedBy: null == redeemedBy
          ? _value.redeemedBy
          : redeemedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as User?,
      referredTo: freezed == referredTo
          ? _value.referredTo
          : referredTo // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get customer {
    return $UserCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get referredBy {
    if (_value.referredBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.referredBy!, (value) {
      return _then(_value.copyWith(referredBy: value) as $Val);
    });
  }

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get referredTo {
    if (_value.referredTo == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.referredTo!, (value) {
      return _then(_value.copyWith(referredTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RedeemPointImplCopyWith<$Res>
    implements $RedeemPointCopyWith<$Res> {
  factory _$$RedeemPointImplCopyWith(
          _$RedeemPointImpl value, $Res Function(_$RedeemPointImpl) then) =
      __$$RedeemPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int createdAt,
      int id,
      String redeemPointAction,
      String redeemedBy,
      String? invoiceNumber,
      int point,
      User customer,
      User? referredBy,
      User? referredTo});

  @override
  $UserCopyWith<$Res> get customer;
  @override
  $UserCopyWith<$Res>? get referredBy;
  @override
  $UserCopyWith<$Res>? get referredTo;
}

/// @nodoc
class __$$RedeemPointImplCopyWithImpl<$Res>
    extends _$RedeemPointCopyWithImpl<$Res, _$RedeemPointImpl>
    implements _$$RedeemPointImplCopyWith<$Res> {
  __$$RedeemPointImplCopyWithImpl(
      _$RedeemPointImpl _value, $Res Function(_$RedeemPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? redeemPointAction = null,
    Object? redeemedBy = null,
    Object? invoiceNumber = freezed,
    Object? point = null,
    Object? customer = null,
    Object? referredBy = freezed,
    Object? referredTo = freezed,
  }) {
    return _then(_$RedeemPointImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      redeemPointAction: null == redeemPointAction
          ? _value.redeemPointAction
          : redeemPointAction // ignore: cast_nullable_to_non_nullable
              as String,
      redeemedBy: null == redeemedBy
          ? _value.redeemedBy
          : redeemedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      referredBy: freezed == referredBy
          ? _value.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as User?,
      referredTo: freezed == referredTo
          ? _value.referredTo
          : referredTo // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RedeemPointImpl implements _RedeemPoint {
  _$RedeemPointImpl(
      {this.createdAt = 0,
      this.id = 0,
      this.redeemPointAction = "",
      this.redeemedBy = "",
      this.invoiceNumber,
      this.point = 0,
      this.customer = const User(),
      this.referredBy = const User(),
      this.referredTo = const User()});

  factory _$RedeemPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$RedeemPointImplFromJson(json);

  @override
  @JsonKey()
  final int createdAt;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String redeemPointAction;
  @override
  @JsonKey()
  final String redeemedBy;
  @override
  final String? invoiceNumber;
  @override
  @JsonKey()
  final int point;
  @override
  @JsonKey()
  final User customer;
  @override
  @JsonKey()
  final User? referredBy;
  @override
  @JsonKey()
  final User? referredTo;

  @override
  String toString() {
    return 'RedeemPoint(createdAt: $createdAt, id: $id, redeemPointAction: $redeemPointAction, redeemedBy: $redeemedBy, invoiceNumber: $invoiceNumber, point: $point, customer: $customer, referredBy: $referredBy, referredTo: $referredTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedeemPointImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.redeemPointAction, redeemPointAction) ||
                other.redeemPointAction == redeemPointAction) &&
            (identical(other.redeemedBy, redeemedBy) ||
                other.redeemedBy == redeemedBy) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.referredTo, referredTo) ||
                other.referredTo == referredTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, redeemPointAction,
      redeemedBy, invoiceNumber, point, customer, referredBy, referredTo);

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedeemPointImplCopyWith<_$RedeemPointImpl> get copyWith =>
      __$$RedeemPointImplCopyWithImpl<_$RedeemPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RedeemPointImplToJson(
      this,
    );
  }
}

abstract class _RedeemPoint implements RedeemPoint {
  factory _RedeemPoint(
      {final int createdAt,
      final int id,
      final String redeemPointAction,
      final String redeemedBy,
      final String? invoiceNumber,
      final int point,
      final User customer,
      final User? referredBy,
      final User? referredTo}) = _$RedeemPointImpl;

  factory _RedeemPoint.fromJson(Map<String, dynamic> json) =
      _$RedeemPointImpl.fromJson;

  @override
  int get createdAt;
  @override
  int get id;
  @override
  String get redeemPointAction;
  @override
  String get redeemedBy;
  @override
  String? get invoiceNumber;
  @override
  int get point;
  @override
  User get customer;
  @override
  User? get referredBy;
  @override
  User? get referredTo;

  /// Create a copy of RedeemPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedeemPointImplCopyWith<_$RedeemPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
