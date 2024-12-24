// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
mixin _$Invoice {
  num get agentFee => throw _privateConstructorUsedError;
  num get shoppingCost => throw _privateConstructorUsedError;
  num get shippingCost => throw _privateConstructorUsedError;
  num get dropOffCost => throw _privateConstructorUsedError;
  num get totalVat => throw _privateConstructorUsedError;
  num get totalTax => throw _privateConstructorUsedError;
  num get totalProduct => throw _privateConstructorUsedError;
  num get totalProductPrice => throw _privateConstructorUsedError;
  num get totalAppliedPoint => throw _privateConstructorUsedError;
  num get totalAppliedPointAmount => throw _privateConstructorUsedError;
  num get totalPrice => throw _privateConstructorUsedError;
  num get paidAmount => throw _privateConstructorUsedError;
  num get finalPrice => throw _privateConstructorUsedError;
  num get exactFinalPrice => throw _privateConstructorUsedError;

  /// Serializes this Invoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {num agentFee,
      num shoppingCost,
      num shippingCost,
      num dropOffCost,
      num totalVat,
      num totalTax,
      num totalProduct,
      num totalProductPrice,
      num totalAppliedPoint,
      num totalAppliedPointAmount,
      num totalPrice,
      num paidAmount,
      num finalPrice,
      num exactFinalPrice});
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentFee = null,
    Object? shoppingCost = null,
    Object? shippingCost = null,
    Object? dropOffCost = null,
    Object? totalVat = null,
    Object? totalTax = null,
    Object? totalProduct = null,
    Object? totalProductPrice = null,
    Object? totalAppliedPoint = null,
    Object? totalAppliedPointAmount = null,
    Object? totalPrice = null,
    Object? paidAmount = null,
    Object? finalPrice = null,
    Object? exactFinalPrice = null,
  }) {
    return _then(_value.copyWith(
      agentFee: null == agentFee
          ? _value.agentFee
          : agentFee // ignore: cast_nullable_to_non_nullable
              as num,
      shoppingCost: null == shoppingCost
          ? _value.shoppingCost
          : shoppingCost // ignore: cast_nullable_to_non_nullable
              as num,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as num,
      dropOffCost: null == dropOffCost
          ? _value.dropOffCost
          : dropOffCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalVat: null == totalVat
          ? _value.totalVat
          : totalVat // ignore: cast_nullable_to_non_nullable
              as num,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as num,
      totalProduct: null == totalProduct
          ? _value.totalProduct
          : totalProduct // ignore: cast_nullable_to_non_nullable
              as num,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as num,
      totalAppliedPoint: null == totalAppliedPoint
          ? _value.totalAppliedPoint
          : totalAppliedPoint // ignore: cast_nullable_to_non_nullable
              as num,
      totalAppliedPointAmount: null == totalAppliedPointAmount
          ? _value.totalAppliedPointAmount
          : totalAppliedPointAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as num,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      exactFinalPrice: null == exactFinalPrice
          ? _value.exactFinalPrice
          : exactFinalPrice // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num agentFee,
      num shoppingCost,
      num shippingCost,
      num dropOffCost,
      num totalVat,
      num totalTax,
      num totalProduct,
      num totalProductPrice,
      num totalAppliedPoint,
      num totalAppliedPointAmount,
      num totalPrice,
      num paidAmount,
      num finalPrice,
      num exactFinalPrice});
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentFee = null,
    Object? shoppingCost = null,
    Object? shippingCost = null,
    Object? dropOffCost = null,
    Object? totalVat = null,
    Object? totalTax = null,
    Object? totalProduct = null,
    Object? totalProductPrice = null,
    Object? totalAppliedPoint = null,
    Object? totalAppliedPointAmount = null,
    Object? totalPrice = null,
    Object? paidAmount = null,
    Object? finalPrice = null,
    Object? exactFinalPrice = null,
  }) {
    return _then(_$InvoiceImpl(
      agentFee: null == agentFee
          ? _value.agentFee
          : agentFee // ignore: cast_nullable_to_non_nullable
              as num,
      shoppingCost: null == shoppingCost
          ? _value.shoppingCost
          : shoppingCost // ignore: cast_nullable_to_non_nullable
              as num,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as num,
      dropOffCost: null == dropOffCost
          ? _value.dropOffCost
          : dropOffCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalVat: null == totalVat
          ? _value.totalVat
          : totalVat // ignore: cast_nullable_to_non_nullable
              as num,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as num,
      totalProduct: null == totalProduct
          ? _value.totalProduct
          : totalProduct // ignore: cast_nullable_to_non_nullable
              as num,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as num,
      totalAppliedPoint: null == totalAppliedPoint
          ? _value.totalAppliedPoint
          : totalAppliedPoint // ignore: cast_nullable_to_non_nullable
              as num,
      totalAppliedPointAmount: null == totalAppliedPointAmount
          ? _value.totalAppliedPointAmount
          : totalAppliedPointAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      paidAmount: null == paidAmount
          ? _value.paidAmount
          : paidAmount // ignore: cast_nullable_to_non_nullable
              as num,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      exactFinalPrice: null == exactFinalPrice
          ? _value.exactFinalPrice
          : exactFinalPrice // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceImpl implements _Invoice {
  const _$InvoiceImpl(
      {this.agentFee = 0,
      this.shoppingCost = 0,
      this.shippingCost = 0,
      this.dropOffCost = 0,
      this.totalVat = 0,
      this.totalTax = 0,
      this.totalProduct = 0,
      this.totalProductPrice = 0,
      this.totalAppliedPoint = 0,
      this.totalAppliedPointAmount = 0,
      this.totalPrice = 0,
      this.paidAmount = 0,
      this.finalPrice = 0,
      this.exactFinalPrice = 0});

  factory _$InvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceImplFromJson(json);

  @override
  @JsonKey()
  final num agentFee;
  @override
  @JsonKey()
  final num shoppingCost;
  @override
  @JsonKey()
  final num shippingCost;
  @override
  @JsonKey()
  final num dropOffCost;
  @override
  @JsonKey()
  final num totalVat;
  @override
  @JsonKey()
  final num totalTax;
  @override
  @JsonKey()
  final num totalProduct;
  @override
  @JsonKey()
  final num totalProductPrice;
  @override
  @JsonKey()
  final num totalAppliedPoint;
  @override
  @JsonKey()
  final num totalAppliedPointAmount;
  @override
  @JsonKey()
  final num totalPrice;
  @override
  @JsonKey()
  final num paidAmount;
  @override
  @JsonKey()
  final num finalPrice;
  @override
  @JsonKey()
  final num exactFinalPrice;

  @override
  String toString() {
    return 'Invoice(agentFee: $agentFee, shoppingCost: $shoppingCost, shippingCost: $shippingCost, dropOffCost: $dropOffCost, totalVat: $totalVat, totalTax: $totalTax, totalProduct: $totalProduct, totalProductPrice: $totalProductPrice, totalAppliedPoint: $totalAppliedPoint, totalAppliedPointAmount: $totalAppliedPointAmount, totalPrice: $totalPrice, paidAmount: $paidAmount, finalPrice: $finalPrice, exactFinalPrice: $exactFinalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceImpl &&
            (identical(other.agentFee, agentFee) ||
                other.agentFee == agentFee) &&
            (identical(other.shoppingCost, shoppingCost) ||
                other.shoppingCost == shoppingCost) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.dropOffCost, dropOffCost) ||
                other.dropOffCost == dropOffCost) &&
            (identical(other.totalVat, totalVat) ||
                other.totalVat == totalVat) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.totalProduct, totalProduct) ||
                other.totalProduct == totalProduct) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.totalAppliedPoint, totalAppliedPoint) ||
                other.totalAppliedPoint == totalAppliedPoint) &&
            (identical(
                    other.totalAppliedPointAmount, totalAppliedPointAmount) ||
                other.totalAppliedPointAmount == totalAppliedPointAmount) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.paidAmount, paidAmount) ||
                other.paidAmount == paidAmount) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.exactFinalPrice, exactFinalPrice) ||
                other.exactFinalPrice == exactFinalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      agentFee,
      shoppingCost,
      shippingCost,
      dropOffCost,
      totalVat,
      totalTax,
      totalProduct,
      totalProductPrice,
      totalAppliedPoint,
      totalAppliedPointAmount,
      totalPrice,
      paidAmount,
      finalPrice,
      exactFinalPrice);

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceImplToJson(
      this,
    );
  }
}

abstract class _Invoice implements Invoice {
  const factory _Invoice(
      {final num agentFee,
      final num shoppingCost,
      final num shippingCost,
      final num dropOffCost,
      final num totalVat,
      final num totalTax,
      final num totalProduct,
      final num totalProductPrice,
      final num totalAppliedPoint,
      final num totalAppliedPointAmount,
      final num totalPrice,
      final num paidAmount,
      final num finalPrice,
      final num exactFinalPrice}) = _$InvoiceImpl;

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$InvoiceImpl.fromJson;

  @override
  num get agentFee;
  @override
  num get shoppingCost;
  @override
  num get shippingCost;
  @override
  num get dropOffCost;
  @override
  num get totalVat;
  @override
  num get totalTax;
  @override
  num get totalProduct;
  @override
  num get totalProductPrice;
  @override
  num get totalAppliedPoint;
  @override
  num get totalAppliedPointAmount;
  @override
  num get totalPrice;
  @override
  num get paidAmount;
  @override
  num get finalPrice;
  @override
  num get exactFinalPrice;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
