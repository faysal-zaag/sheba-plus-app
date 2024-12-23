// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
mixin _$Config {
  int get createdAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get maxBudget => throw _privateConstructorUsedError;
  int get hourlyRates => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get vat => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get currencyConversionRate => throw _privateConstructorUsedError;
  int get dropOffCharge => throw _privateConstructorUsedError;
  int get referralPoint => throw _privateConstructorUsedError;
  int get referralPointConversionRate => throw _privateConstructorUsedError;

  /// Serializes this Config to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res, Config>;
  @useResult
  $Res call(
      {int createdAt,
      int updatedAt,
      int id,
      int maxBudget,
      int hourlyRates,
      double tax,
      double vat,
      String currency,
      double currencyConversionRate,
      int dropOffCharge,
      int referralPoint,
      int referralPointConversionRate});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res, $Val extends Config>
    implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? maxBudget = null,
    Object? hourlyRates = null,
    Object? tax = null,
    Object? vat = null,
    Object? currency = null,
    Object? currencyConversionRate = null,
    Object? dropOffCharge = null,
    Object? referralPoint = null,
    Object? referralPointConversionRate = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxBudget: null == maxBudget
          ? _value.maxBudget
          : maxBudget // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyRates: null == hourlyRates
          ? _value.hourlyRates
          : hourlyRates // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      vat: null == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencyConversionRate: null == currencyConversionRate
          ? _value.currencyConversionRate
          : currencyConversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      dropOffCharge: null == dropOffCharge
          ? _value.dropOffCharge
          : dropOffCharge // ignore: cast_nullable_to_non_nullable
              as int,
      referralPoint: null == referralPoint
          ? _value.referralPoint
          : referralPoint // ignore: cast_nullable_to_non_nullable
              as int,
      referralPointConversionRate: null == referralPointConversionRate
          ? _value.referralPointConversionRate
          : referralPointConversionRate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfigImplCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$$ConfigImplCopyWith(
          _$ConfigImpl value, $Res Function(_$ConfigImpl) then) =
      __$$ConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int createdAt,
      int updatedAt,
      int id,
      int maxBudget,
      int hourlyRates,
      double tax,
      double vat,
      String currency,
      double currencyConversionRate,
      int dropOffCharge,
      int referralPoint,
      int referralPointConversionRate});
}

/// @nodoc
class __$$ConfigImplCopyWithImpl<$Res>
    extends _$ConfigCopyWithImpl<$Res, _$ConfigImpl>
    implements _$$ConfigImplCopyWith<$Res> {
  __$$ConfigImplCopyWithImpl(
      _$ConfigImpl _value, $Res Function(_$ConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? maxBudget = null,
    Object? hourlyRates = null,
    Object? tax = null,
    Object? vat = null,
    Object? currency = null,
    Object? currencyConversionRate = null,
    Object? dropOffCharge = null,
    Object? referralPoint = null,
    Object? referralPointConversionRate = null,
  }) {
    return _then(_$ConfigImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      maxBudget: null == maxBudget
          ? _value.maxBudget
          : maxBudget // ignore: cast_nullable_to_non_nullable
              as int,
      hourlyRates: null == hourlyRates
          ? _value.hourlyRates
          : hourlyRates // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      vat: null == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      currencyConversionRate: null == currencyConversionRate
          ? _value.currencyConversionRate
          : currencyConversionRate // ignore: cast_nullable_to_non_nullable
              as double,
      dropOffCharge: null == dropOffCharge
          ? _value.dropOffCharge
          : dropOffCharge // ignore: cast_nullable_to_non_nullable
              as int,
      referralPoint: null == referralPoint
          ? _value.referralPoint
          : referralPoint // ignore: cast_nullable_to_non_nullable
              as int,
      referralPointConversionRate: null == referralPointConversionRate
          ? _value.referralPointConversionRate
          : referralPointConversionRate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfigImpl implements _Config {
  const _$ConfigImpl(
      {this.createdAt = 0,
      this.updatedAt = 0,
      this.id = 0,
      this.maxBudget = 0,
      this.hourlyRates = 0,
      this.tax = 0.0,
      this.vat = 0.0,
      this.currency = 'CAD',
      this.currencyConversionRate = 1.0,
      this.dropOffCharge = 0,
      this.referralPoint = 0,
      this.referralPointConversionRate = 0});

  factory _$ConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfigImplFromJson(json);

  @override
  @JsonKey()
  final int createdAt;
  @override
  @JsonKey()
  final int updatedAt;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int maxBudget;
  @override
  @JsonKey()
  final int hourlyRates;
  @override
  @JsonKey()
  final double tax;
  @override
  @JsonKey()
  final double vat;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final double currencyConversionRate;
  @override
  @JsonKey()
  final int dropOffCharge;
  @override
  @JsonKey()
  final int referralPoint;
  @override
  @JsonKey()
  final int referralPointConversionRate;

  @override
  String toString() {
    return 'Config(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, maxBudget: $maxBudget, hourlyRates: $hourlyRates, tax: $tax, vat: $vat, currency: $currency, currencyConversionRate: $currencyConversionRate, dropOffCharge: $dropOffCharge, referralPoint: $referralPoint, referralPointConversionRate: $referralPointConversionRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfigImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.maxBudget, maxBudget) ||
                other.maxBudget == maxBudget) &&
            (identical(other.hourlyRates, hourlyRates) ||
                other.hourlyRates == hourlyRates) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencyConversionRate, currencyConversionRate) ||
                other.currencyConversionRate == currencyConversionRate) &&
            (identical(other.dropOffCharge, dropOffCharge) ||
                other.dropOffCharge == dropOffCharge) &&
            (identical(other.referralPoint, referralPoint) ||
                other.referralPoint == referralPoint) &&
            (identical(other.referralPointConversionRate,
                    referralPointConversionRate) ||
                other.referralPointConversionRate ==
                    referralPointConversionRate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      id,
      maxBudget,
      hourlyRates,
      tax,
      vat,
      currency,
      currencyConversionRate,
      dropOffCharge,
      referralPoint,
      referralPointConversionRate);

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      __$$ConfigImplCopyWithImpl<_$ConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfigImplToJson(
      this,
    );
  }
}

abstract class _Config implements Config {
  const factory _Config(
      {final int createdAt,
      final int updatedAt,
      final int id,
      final int maxBudget,
      final int hourlyRates,
      final double tax,
      final double vat,
      final String currency,
      final double currencyConversionRate,
      final int dropOffCharge,
      final int referralPoint,
      final int referralPointConversionRate}) = _$ConfigImpl;

  factory _Config.fromJson(Map<String, dynamic> json) = _$ConfigImpl.fromJson;

  @override
  int get createdAt;
  @override
  int get updatedAt;
  @override
  int get id;
  @override
  int get maxBudget;
  @override
  int get hourlyRates;
  @override
  double get tax;
  @override
  double get vat;
  @override
  String get currency;
  @override
  double get currencyConversionRate;
  @override
  int get dropOffCharge;
  @override
  int get referralPoint;
  @override
  int get referralPointConversionRate;

  /// Create a copy of Config
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfigImplCopyWith<_$ConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
