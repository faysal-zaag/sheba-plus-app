// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_item_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShopItemInfo _$ShopItemInfoFromJson(Map<String, dynamic> json) {
  return _ShopItemInfo.fromJson(json);
}

/// @nodoc
mixin _$ShopItemInfo {
  String get shopName => throw _privateConstructorUsedError;
  String get shopAddress => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  List<ShopItem> get items => throw _privateConstructorUsedError;

  /// Serializes this ShopItemInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopItemInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopItemInfoCopyWith<ShopItemInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemInfoCopyWith<$Res> {
  factory $ShopItemInfoCopyWith(
          ShopItemInfo value, $Res Function(ShopItemInfo) then) =
      _$ShopItemInfoCopyWithImpl<$Res, ShopItemInfo>;
  @useResult
  $Res call(
      {String shopName,
      String shopAddress,
      String contactNumber,
      List<ShopItem> items});
}

/// @nodoc
class _$ShopItemInfoCopyWithImpl<$Res, $Val extends ShopItemInfo>
    implements $ShopItemInfoCopyWith<$Res> {
  _$ShopItemInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopItemInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopName = null,
    Object? shopAddress = null,
    Object? contactNumber = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopItemInfoImplCopyWith<$Res>
    implements $ShopItemInfoCopyWith<$Res> {
  factory _$$ShopItemInfoImplCopyWith(
          _$ShopItemInfoImpl value, $Res Function(_$ShopItemInfoImpl) then) =
      __$$ShopItemInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shopName,
      String shopAddress,
      String contactNumber,
      List<ShopItem> items});
}

/// @nodoc
class __$$ShopItemInfoImplCopyWithImpl<$Res>
    extends _$ShopItemInfoCopyWithImpl<$Res, _$ShopItemInfoImpl>
    implements _$$ShopItemInfoImplCopyWith<$Res> {
  __$$ShopItemInfoImplCopyWithImpl(
      _$ShopItemInfoImpl _value, $Res Function(_$ShopItemInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShopItemInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shopName = null,
    Object? shopAddress = null,
    Object? contactNumber = null,
    Object? items = null,
  }) {
    return _then(_$ShopItemInfoImpl(
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShopItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopItemInfoImpl implements _ShopItemInfo {
  const _$ShopItemInfoImpl(
      {this.shopName = "",
      this.shopAddress = "",
      this.contactNumber = "",
      final List<ShopItem> items = const []})
      : _items = items;

  factory _$ShopItemInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopItemInfoImplFromJson(json);

  @override
  @JsonKey()
  final String shopName;
  @override
  @JsonKey()
  final String shopAddress;
  @override
  @JsonKey()
  final String contactNumber;
  final List<ShopItem> _items;
  @override
  @JsonKey()
  List<ShopItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ShopItemInfo(shopName: $shopName, shopAddress: $shopAddress, contactNumber: $contactNumber, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopItemInfoImpl &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shopName, shopAddress,
      contactNumber, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ShopItemInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopItemInfoImplCopyWith<_$ShopItemInfoImpl> get copyWith =>
      __$$ShopItemInfoImplCopyWithImpl<_$ShopItemInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopItemInfoImplToJson(
      this,
    );
  }
}

abstract class _ShopItemInfo implements ShopItemInfo {
  const factory _ShopItemInfo(
      {final String shopName,
      final String shopAddress,
      final String contactNumber,
      final List<ShopItem> items}) = _$ShopItemInfoImpl;

  factory _ShopItemInfo.fromJson(Map<String, dynamic> json) =
      _$ShopItemInfoImpl.fromJson;

  @override
  String get shopName;
  @override
  String get shopAddress;
  @override
  String get contactNumber;
  @override
  List<ShopItem> get items;

  /// Create a copy of ShopItemInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopItemInfoImplCopyWith<_$ShopItemInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShopItem _$ShopItemFromJson(Map<String, dynamic> json) {
  return _ShopItem.fromJson(json);
}

/// @nodoc
mixin _$ShopItem {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this ShopItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShopItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShopItemCopyWith<ShopItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopItemCopyWith<$Res> {
  factory $ShopItemCopyWith(ShopItem value, $Res Function(ShopItem) then) =
      _$ShopItemCopyWithImpl<$Res, ShopItem>;
  @useResult
  $Res call({String name, int quantity});
}

/// @nodoc
class _$ShopItemCopyWithImpl<$Res, $Val extends ShopItem>
    implements $ShopItemCopyWith<$Res> {
  _$ShopItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShopItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopItemImplCopyWith<$Res>
    implements $ShopItemCopyWith<$Res> {
  factory _$$ShopItemImplCopyWith(
          _$ShopItemImpl value, $Res Function(_$ShopItemImpl) then) =
      __$$ShopItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int quantity});
}

/// @nodoc
class __$$ShopItemImplCopyWithImpl<$Res>
    extends _$ShopItemCopyWithImpl<$Res, _$ShopItemImpl>
    implements _$$ShopItemImplCopyWith<$Res> {
  __$$ShopItemImplCopyWithImpl(
      _$ShopItemImpl _value, $Res Function(_$ShopItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShopItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
  }) {
    return _then(_$ShopItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopItemImpl implements _ShopItem {
  const _$ShopItemImpl({this.name = "Unknown", this.quantity = 0});

  factory _$ShopItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopItemImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int quantity;

  @override
  String toString() {
    return 'ShopItem(name: $name, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, quantity);

  /// Create a copy of ShopItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      __$$ShopItemImplCopyWithImpl<_$ShopItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopItemImplToJson(
      this,
    );
  }
}

abstract class _ShopItem implements ShopItem {
  const factory _ShopItem({final String name, final int quantity}) =
      _$ShopItemImpl;

  factory _ShopItem.fromJson(Map<String, dynamic> json) =
      _$ShopItemImpl.fromJson;

  @override
  String get name;
  @override
  int get quantity;

  /// Create a copy of ShopItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShopItemImplCopyWith<_$ShopItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
