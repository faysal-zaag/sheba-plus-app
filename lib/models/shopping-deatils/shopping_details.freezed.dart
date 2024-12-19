// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingDetails _$ShoppingDetailsFromJson(Map<String, dynamic> json) {
  return _ShoppingDetails.fromJson(json);
}

/// @nodoc
mixin _$ShoppingDetails {
  int get id => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  int get taxAmount => throw _privateConstructorUsedError;
  int get vat => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  int get totalItemPrice => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  int? get alreadyPaid => throw _privateConstructorUsedError;
  List<ShoppingItemDetails> get shoppingItemDetailsList =>
      throw _privateConstructorUsedError;

  /// Serializes this ShoppingDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingDetailsCopyWith<ShoppingDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingDetailsCopyWith<$Res> {
  factory $ShoppingDetailsCopyWith(
          ShoppingDetails value, $Res Function(ShoppingDetails) then) =
      _$ShoppingDetailsCopyWithImpl<$Res, ShoppingDetails>;
  @useResult
  $Res call(
      {int id,
      String shopName,
      int taxAmount,
      int vat,
      int totalItems,
      int totalItemPrice,
      int totalPrice,
      int? alreadyPaid,
      List<ShoppingItemDetails> shoppingItemDetailsList});
}

/// @nodoc
class _$ShoppingDetailsCopyWithImpl<$Res, $Val extends ShoppingDetails>
    implements $ShoppingDetailsCopyWith<$Res> {
  _$ShoppingDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shopName = null,
    Object? taxAmount = null,
    Object? vat = null,
    Object? totalItems = null,
    Object? totalItemPrice = null,
    Object? totalPrice = null,
    Object? alreadyPaid = freezed,
    Object? shoppingItemDetailsList = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as int,
      vat: null == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalItemPrice: null == totalItemPrice
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      alreadyPaid: freezed == alreadyPaid
          ? _value.alreadyPaid
          : alreadyPaid // ignore: cast_nullable_to_non_nullable
              as int?,
      shoppingItemDetailsList: null == shoppingItemDetailsList
          ? _value.shoppingItemDetailsList
          : shoppingItemDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItemDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingDetailsImplCopyWith<$Res>
    implements $ShoppingDetailsCopyWith<$Res> {
  factory _$$ShoppingDetailsImplCopyWith(_$ShoppingDetailsImpl value,
          $Res Function(_$ShoppingDetailsImpl) then) =
      __$$ShoppingDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String shopName,
      int taxAmount,
      int vat,
      int totalItems,
      int totalItemPrice,
      int totalPrice,
      int? alreadyPaid,
      List<ShoppingItemDetails> shoppingItemDetailsList});
}

/// @nodoc
class __$$ShoppingDetailsImplCopyWithImpl<$Res>
    extends _$ShoppingDetailsCopyWithImpl<$Res, _$ShoppingDetailsImpl>
    implements _$$ShoppingDetailsImplCopyWith<$Res> {
  __$$ShoppingDetailsImplCopyWithImpl(
      _$ShoppingDetailsImpl _value, $Res Function(_$ShoppingDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shopName = null,
    Object? taxAmount = null,
    Object? vat = null,
    Object? totalItems = null,
    Object? totalItemPrice = null,
    Object? totalPrice = null,
    Object? alreadyPaid = freezed,
    Object? shoppingItemDetailsList = null,
  }) {
    return _then(_$ShoppingDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as int,
      vat: null == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      totalItemPrice: null == totalItemPrice
          ? _value.totalItemPrice
          : totalItemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      alreadyPaid: freezed == alreadyPaid
          ? _value.alreadyPaid
          : alreadyPaid // ignore: cast_nullable_to_non_nullable
              as int?,
      shoppingItemDetailsList: null == shoppingItemDetailsList
          ? _value._shoppingItemDetailsList
          : shoppingItemDetailsList // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItemDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingDetailsImpl implements _ShoppingDetails {
  const _$ShoppingDetailsImpl(
      {this.id = 0,
      this.shopName = "",
      this.taxAmount = 0,
      this.vat = 0,
      this.totalItems = 0,
      this.totalItemPrice = 0,
      this.totalPrice = 0,
      this.alreadyPaid,
      final List<ShoppingItemDetails> shoppingItemDetailsList = const []})
      : _shoppingItemDetailsList = shoppingItemDetailsList;

  factory _$ShoppingDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingDetailsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String shopName;
  @override
  @JsonKey()
  final int taxAmount;
  @override
  @JsonKey()
  final int vat;
  @override
  @JsonKey()
  final int totalItems;
  @override
  @JsonKey()
  final int totalItemPrice;
  @override
  @JsonKey()
  final int totalPrice;
  @override
  final int? alreadyPaid;
  final List<ShoppingItemDetails> _shoppingItemDetailsList;
  @override
  @JsonKey()
  List<ShoppingItemDetails> get shoppingItemDetailsList {
    if (_shoppingItemDetailsList is EqualUnmodifiableListView)
      return _shoppingItemDetailsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingItemDetailsList);
  }

  @override
  String toString() {
    return 'ShoppingDetails(id: $id, shopName: $shopName, taxAmount: $taxAmount, vat: $vat, totalItems: $totalItems, totalItemPrice: $totalItemPrice, totalPrice: $totalPrice, alreadyPaid: $alreadyPaid, shoppingItemDetailsList: $shoppingItemDetailsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            (identical(other.totalItemPrice, totalItemPrice) ||
                other.totalItemPrice == totalItemPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.alreadyPaid, alreadyPaid) ||
                other.alreadyPaid == alreadyPaid) &&
            const DeepCollectionEquality().equals(
                other._shoppingItemDetailsList, _shoppingItemDetailsList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      shopName,
      taxAmount,
      vat,
      totalItems,
      totalItemPrice,
      totalPrice,
      alreadyPaid,
      const DeepCollectionEquality().hash(_shoppingItemDetailsList));

  /// Create a copy of ShoppingDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingDetailsImplCopyWith<_$ShoppingDetailsImpl> get copyWith =>
      __$$ShoppingDetailsImplCopyWithImpl<_$ShoppingDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingDetailsImplToJson(
      this,
    );
  }
}

abstract class _ShoppingDetails implements ShoppingDetails {
  const factory _ShoppingDetails(
          {final int id,
          final String shopName,
          final int taxAmount,
          final int vat,
          final int totalItems,
          final int totalItemPrice,
          final int totalPrice,
          final int? alreadyPaid,
          final List<ShoppingItemDetails> shoppingItemDetailsList}) =
      _$ShoppingDetailsImpl;

  factory _ShoppingDetails.fromJson(Map<String, dynamic> json) =
      _$ShoppingDetailsImpl.fromJson;

  @override
  int get id;
  @override
  String get shopName;
  @override
  int get taxAmount;
  @override
  int get vat;
  @override
  int get totalItems;
  @override
  int get totalItemPrice;
  @override
  int get totalPrice;
  @override
  int? get alreadyPaid;
  @override
  List<ShoppingItemDetails> get shoppingItemDetailsList;

  /// Create a copy of ShoppingDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingDetailsImplCopyWith<_$ShoppingDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShoppingItemDetails _$ShoppingItemDetailsFromJson(Map<String, dynamic> json) {
  return _ShoppingItemDetails.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItemDetails {
  int get id => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this ShoppingItemDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemDetailsCopyWith<ShoppingItemDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemDetailsCopyWith<$Res> {
  factory $ShoppingItemDetailsCopyWith(
          ShoppingItemDetails value, $Res Function(ShoppingItemDetails) then) =
      _$ShoppingItemDetailsCopyWithImpl<$Res, ShoppingItemDetails>;
  @useResult
  $Res call({int id, int price, int quantity, int totalPrice});
}

/// @nodoc
class _$ShoppingItemDetailsCopyWithImpl<$Res, $Val extends ShoppingItemDetails>
    implements $ShoppingItemDetailsCopyWith<$Res> {
  _$ShoppingItemDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemDetailsImplCopyWith<$Res>
    implements $ShoppingItemDetailsCopyWith<$Res> {
  factory _$$ShoppingItemDetailsImplCopyWith(_$ShoppingItemDetailsImpl value,
          $Res Function(_$ShoppingItemDetailsImpl) then) =
      __$$ShoppingItemDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int price, int quantity, int totalPrice});
}

/// @nodoc
class __$$ShoppingItemDetailsImplCopyWithImpl<$Res>
    extends _$ShoppingItemDetailsCopyWithImpl<$Res, _$ShoppingItemDetailsImpl>
    implements _$$ShoppingItemDetailsImplCopyWith<$Res> {
  __$$ShoppingItemDetailsImplCopyWithImpl(_$ShoppingItemDetailsImpl _value,
      $Res Function(_$ShoppingItemDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? quantity = null,
    Object? totalPrice = null,
  }) {
    return _then(_$ShoppingItemDetailsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingItemDetailsImpl implements _ShoppingItemDetails {
  const _$ShoppingItemDetailsImpl(
      {this.id = 0, this.price = 0, this.quantity = 0, this.totalPrice = 0});

  factory _$ShoppingItemDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemDetailsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final int totalPrice;

  @override
  String toString() {
    return 'ShoppingItemDetails(id: $id, price: $price, quantity: $quantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, price, quantity, totalPrice);

  /// Create a copy of ShoppingItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemDetailsImplCopyWith<_$ShoppingItemDetailsImpl> get copyWith =>
      __$$ShoppingItemDetailsImplCopyWithImpl<_$ShoppingItemDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemDetailsImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItemDetails implements ShoppingItemDetails {
  const factory _ShoppingItemDetails(
      {final int id,
      final int price,
      final int quantity,
      final int totalPrice}) = _$ShoppingItemDetailsImpl;

  factory _ShoppingItemDetails.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemDetailsImpl.fromJson;

  @override
  int get id;
  @override
  int get price;
  @override
  int get quantity;
  @override
  int get totalPrice;

  /// Create a copy of ShoppingItemDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemDetailsImplCopyWith<_$ShoppingItemDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
