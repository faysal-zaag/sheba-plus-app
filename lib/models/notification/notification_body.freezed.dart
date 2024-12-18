// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationBody _$NotificationBodyFromJson(Map<String, dynamic> json) {
  return _NotificationBody.fromJson(json);
}

/// @nodoc
mixin _$NotificationBody {
  String get agentPurchaseHour => throw _privateConstructorUsedError;
  String get shoppingArea => throw _privateConstructorUsedError;
  String get meetingTime => throw _privateConstructorUsedError;
  String get ticketNumber => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this NotificationBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationBodyCopyWith<NotificationBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationBodyCopyWith<$Res> {
  factory $NotificationBodyCopyWith(
          NotificationBody value, $Res Function(NotificationBody) then) =
      _$NotificationBodyCopyWithImpl<$Res, NotificationBody>;
  @useResult
  $Res call(
      {String agentPurchaseHour,
      String shoppingArea,
      String meetingTime,
      String ticketNumber,
      String message});
}

/// @nodoc
class _$NotificationBodyCopyWithImpl<$Res, $Val extends NotificationBody>
    implements $NotificationBodyCopyWith<$Res> {
  _$NotificationBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentPurchaseHour = null,
    Object? shoppingArea = null,
    Object? meetingTime = null,
    Object? ticketNumber = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      agentPurchaseHour: null == agentPurchaseHour
          ? _value.agentPurchaseHour
          : agentPurchaseHour // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingArea: null == shoppingArea
          ? _value.shoppingArea
          : shoppingArea // ignore: cast_nullable_to_non_nullable
              as String,
      meetingTime: null == meetingTime
          ? _value.meetingTime
          : meetingTime // ignore: cast_nullable_to_non_nullable
              as String,
      ticketNumber: null == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationBodyImplCopyWith<$Res>
    implements $NotificationBodyCopyWith<$Res> {
  factory _$$NotificationBodyImplCopyWith(_$NotificationBodyImpl value,
          $Res Function(_$NotificationBodyImpl) then) =
      __$$NotificationBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String agentPurchaseHour,
      String shoppingArea,
      String meetingTime,
      String ticketNumber,
      String message});
}

/// @nodoc
class __$$NotificationBodyImplCopyWithImpl<$Res>
    extends _$NotificationBodyCopyWithImpl<$Res, _$NotificationBodyImpl>
    implements _$$NotificationBodyImplCopyWith<$Res> {
  __$$NotificationBodyImplCopyWithImpl(_$NotificationBodyImpl _value,
      $Res Function(_$NotificationBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentPurchaseHour = null,
    Object? shoppingArea = null,
    Object? meetingTime = null,
    Object? ticketNumber = null,
    Object? message = null,
  }) {
    return _then(_$NotificationBodyImpl(
      agentPurchaseHour: null == agentPurchaseHour
          ? _value.agentPurchaseHour
          : agentPurchaseHour // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingArea: null == shoppingArea
          ? _value.shoppingArea
          : shoppingArea // ignore: cast_nullable_to_non_nullable
              as String,
      meetingTime: null == meetingTime
          ? _value.meetingTime
          : meetingTime // ignore: cast_nullable_to_non_nullable
              as String,
      ticketNumber: null == ticketNumber
          ? _value.ticketNumber
          : ticketNumber // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationBodyImpl implements _NotificationBody {
  const _$NotificationBodyImpl(
      {this.agentPurchaseHour = '',
      this.shoppingArea = '',
      this.meetingTime = '',
      this.ticketNumber = '',
      this.message = ''});

  factory _$NotificationBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationBodyImplFromJson(json);

  @override
  @JsonKey()
  final String agentPurchaseHour;
  @override
  @JsonKey()
  final String shoppingArea;
  @override
  @JsonKey()
  final String meetingTime;
  @override
  @JsonKey()
  final String ticketNumber;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'NotificationBody(agentPurchaseHour: $agentPurchaseHour, shoppingArea: $shoppingArea, meetingTime: $meetingTime, ticketNumber: $ticketNumber, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationBodyImpl &&
            (identical(other.agentPurchaseHour, agentPurchaseHour) ||
                other.agentPurchaseHour == agentPurchaseHour) &&
            (identical(other.shoppingArea, shoppingArea) ||
                other.shoppingArea == shoppingArea) &&
            (identical(other.meetingTime, meetingTime) ||
                other.meetingTime == meetingTime) &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, agentPurchaseHour, shoppingArea,
      meetingTime, ticketNumber, message);

  /// Create a copy of NotificationBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationBodyImplCopyWith<_$NotificationBodyImpl> get copyWith =>
      __$$NotificationBodyImplCopyWithImpl<_$NotificationBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationBodyImplToJson(
      this,
    );
  }
}

abstract class _NotificationBody implements NotificationBody {
  const factory _NotificationBody(
      {final String agentPurchaseHour,
      final String shoppingArea,
      final String meetingTime,
      final String ticketNumber,
      final String message}) = _$NotificationBodyImpl;

  factory _NotificationBody.fromJson(Map<String, dynamic> json) =
      _$NotificationBodyImpl.fromJson;

  @override
  String get agentPurchaseHour;
  @override
  String get shoppingArea;
  @override
  String get meetingTime;
  @override
  String get ticketNumber;
  @override
  String get message;

  /// Create a copy of NotificationBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationBodyImplCopyWith<_$NotificationBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
