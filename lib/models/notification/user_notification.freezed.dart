// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserNotification _$UserNotificationFromJson(Map<String, dynamic> json) {
  return _UserNotification.fromJson(json);
}

/// @nodoc
mixin _$UserNotification {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  bool get readStats => throw _privateConstructorUsedError;
  String? get ticketNo => throw _privateConstructorUsedError;
  NotificationBody? get body => throw _privateConstructorUsedError;
  int? get dataId => throw _privateConstructorUsedError;
  String? get dataTable => throw _privateConstructorUsedError;
  String? get notificationType => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  /// Serializes this UserNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserNotificationCopyWith<UserNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNotificationCopyWith<$Res> {
  factory $UserNotificationCopyWith(
          UserNotification value, $Res Function(UserNotification) then) =
      _$UserNotificationCopyWithImpl<$Res, UserNotification>;
  @useResult
  $Res call(
      {int id,
      String title,
      String details,
      bool readStats,
      String? ticketNo,
      NotificationBody? body,
      int? dataId,
      String? dataTable,
      String? notificationType,
      User? user});

  $NotificationBodyCopyWith<$Res>? get body;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserNotificationCopyWithImpl<$Res, $Val extends UserNotification>
    implements $UserNotificationCopyWith<$Res> {
  _$UserNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? details = null,
    Object? readStats = null,
    Object? ticketNo = freezed,
    Object? body = freezed,
    Object? dataId = freezed,
    Object? dataTable = freezed,
    Object? notificationType = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      readStats: null == readStats
          ? _value.readStats
          : readStats // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketNo: freezed == ticketNo
          ? _value.ticketNo
          : ticketNo // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as NotificationBody?,
      dataId: freezed == dataId
          ? _value.dataId
          : dataId // ignore: cast_nullable_to_non_nullable
              as int?,
      dataTable: freezed == dataTable
          ? _value.dataTable
          : dataTable // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationType: freezed == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationBodyCopyWith<$Res>? get body {
    if (_value.body == null) {
      return null;
    }

    return $NotificationBodyCopyWith<$Res>(_value.body!, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserNotificationImplCopyWith<$Res>
    implements $UserNotificationCopyWith<$Res> {
  factory _$$UserNotificationImplCopyWith(_$UserNotificationImpl value,
          $Res Function(_$UserNotificationImpl) then) =
      __$$UserNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String details,
      bool readStats,
      String? ticketNo,
      NotificationBody? body,
      int? dataId,
      String? dataTable,
      String? notificationType,
      User? user});

  @override
  $NotificationBodyCopyWith<$Res>? get body;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserNotificationImplCopyWithImpl<$Res>
    extends _$UserNotificationCopyWithImpl<$Res, _$UserNotificationImpl>
    implements _$$UserNotificationImplCopyWith<$Res> {
  __$$UserNotificationImplCopyWithImpl(_$UserNotificationImpl _value,
      $Res Function(_$UserNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? details = null,
    Object? readStats = null,
    Object? ticketNo = freezed,
    Object? body = freezed,
    Object? dataId = freezed,
    Object? dataTable = freezed,
    Object? notificationType = freezed,
    Object? user = freezed,
  }) {
    return _then(_$UserNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      readStats: null == readStats
          ? _value.readStats
          : readStats // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketNo: freezed == ticketNo
          ? _value.ticketNo
          : ticketNo // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as NotificationBody?,
      dataId: freezed == dataId
          ? _value.dataId
          : dataId // ignore: cast_nullable_to_non_nullable
              as int?,
      dataTable: freezed == dataTable
          ? _value.dataTable
          : dataTable // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationType: freezed == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserNotificationImpl implements _UserNotification {
  const _$UserNotificationImpl(
      {this.id = 0,
      this.title = "",
      this.details = "",
      this.readStats = false,
      this.ticketNo,
      this.body,
      this.dataId,
      this.dataTable,
      this.notificationType,
      this.user});

  factory _$UserNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNotificationImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String details;
  @override
  @JsonKey()
  final bool readStats;
  @override
  final String? ticketNo;
  @override
  final NotificationBody? body;
  @override
  final int? dataId;
  @override
  final String? dataTable;
  @override
  final String? notificationType;
  @override
  final User? user;

  @override
  String toString() {
    return 'UserNotification(id: $id, title: $title, details: $details, readStats: $readStats, ticketNo: $ticketNo, body: $body, dataId: $dataId, dataTable: $dataTable, notificationType: $notificationType, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.readStats, readStats) ||
                other.readStats == readStats) &&
            (identical(other.ticketNo, ticketNo) ||
                other.ticketNo == ticketNo) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.dataId, dataId) || other.dataId == dataId) &&
            (identical(other.dataTable, dataTable) ||
                other.dataTable == dataTable) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, details, readStats,
      ticketNo, body, dataId, dataTable, notificationType, user);

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotificationImplCopyWith<_$UserNotificationImpl> get copyWith =>
      __$$UserNotificationImplCopyWithImpl<_$UserNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNotificationImplToJson(
      this,
    );
  }
}

abstract class _UserNotification implements UserNotification {
  const factory _UserNotification(
      {final int id,
      final String title,
      final String details,
      final bool readStats,
      final String? ticketNo,
      final NotificationBody? body,
      final int? dataId,
      final String? dataTable,
      final String? notificationType,
      final User? user}) = _$UserNotificationImpl;

  factory _UserNotification.fromJson(Map<String, dynamic> json) =
      _$UserNotificationImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get details;
  @override
  bool get readStats;
  @override
  String? get ticketNo;
  @override
  NotificationBody? get body;
  @override
  int? get dataId;
  @override
  String? get dataTable;
  @override
  String? get notificationType;
  @override
  User? get user;

  /// Create a copy of UserNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNotificationImplCopyWith<_$UserNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
