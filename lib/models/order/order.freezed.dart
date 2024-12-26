// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get id => throw _privateConstructorUsedError;
  Invoice get invoice => throw _privateConstructorUsedError;
  Address get dropOffAddress => throw _privateConstructorUsedError;
  List<Order> get shoppingDetailsList => throw _privateConstructorUsedError;

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int id,
      Invoice invoice,
      Address dropOffAddress,
      List<Order> shoppingDetailsList});

  $InvoiceCopyWith<$Res> get invoice;
  $AddressCopyWith<$Res> get dropOffAddress;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoice = null,
    Object? dropOffAddress = null,
    Object? shoppingDetailsList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoice,
      dropOffAddress: null == dropOffAddress
          ? _value.dropOffAddress
          : dropOffAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      shoppingDetailsList: null == shoppingDetailsList
          ? _value.shoppingDetailsList
          : shoppingDetailsList // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceCopyWith<$Res> get invoice {
    return $InvoiceCopyWith<$Res>(_value.invoice, (value) {
      return _then(_value.copyWith(invoice: value) as $Val);
    });
  }

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get dropOffAddress {
    return $AddressCopyWith<$Res>(_value.dropOffAddress, (value) {
      return _then(_value.copyWith(dropOffAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Invoice invoice,
      Address dropOffAddress,
      List<Order> shoppingDetailsList});

  @override
  $InvoiceCopyWith<$Res> get invoice;
  @override
  $AddressCopyWith<$Res> get dropOffAddress;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoice = null,
    Object? dropOffAddress = null,
    Object? shoppingDetailsList = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoice,
      dropOffAddress: null == dropOffAddress
          ? _value.dropOffAddress
          : dropOffAddress // ignore: cast_nullable_to_non_nullable
              as Address,
      shoppingDetailsList: null == shoppingDetailsList
          ? _value._shoppingDetailsList
          : shoppingDetailsList // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {this.id = 0,
      this.invoice = const Invoice(),
      this.dropOffAddress = const Address(),
      final List<Order> shoppingDetailsList = const []})
      : _shoppingDetailsList = shoppingDetailsList;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final Invoice invoice;
  @override
  @JsonKey()
  final Address dropOffAddress;
  final List<Order> _shoppingDetailsList;
  @override
  @JsonKey()
  List<Order> get shoppingDetailsList {
    if (_shoppingDetailsList is EqualUnmodifiableListView)
      return _shoppingDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingDetailsList);
  }

  @override
  String toString() {
    return 'Order(id: $id, invoice: $invoice, dropOffAddress: $dropOffAddress, shoppingDetailsList: $shoppingDetailsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            (identical(other.dropOffAddress, dropOffAddress) ||
                other.dropOffAddress == dropOffAddress) &&
            const DeepCollectionEquality()
                .equals(other._shoppingDetailsList, _shoppingDetailsList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, invoice, dropOffAddress,
      const DeepCollectionEquality().hash(_shoppingDetailsList));

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {final int id,
      final Invoice invoice,
      final Address dropOffAddress,
      final List<Order> shoppingDetailsList}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get id;
  @override
  Invoice get invoice;
  @override
  Address get dropOffAddress;
  @override
  List<Order> get shoppingDetailsList;

  /// Create a copy of Order
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
