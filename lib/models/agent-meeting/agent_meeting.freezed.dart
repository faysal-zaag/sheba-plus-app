// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_meeting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgentMeeting _$AgentMeetingFromJson(Map<String, dynamic> json) {
  return _AgentMeeting.fromJson(json);
}

/// @nodoc
mixin _$AgentMeeting {
  num get createdAt => throw _privateConstructorUsedError;
  num get id => throw _privateConstructorUsedError;
  List<String> get meetingLocations => throw _privateConstructorUsedError;
  num get meetingTime => throw _privateConstructorUsedError;
  num get meetingEndTime => throw _privateConstructorUsedError;
  num get estimatedBudget => throw _privateConstructorUsedError;
  num get estimatedBudgetInBdt => throw _privateConstructorUsedError;
  num get hourBooked => throw _privateConstructorUsedError;
  User get agent => throw _privateConstructorUsedError;

  /// Serializes this AgentMeeting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgentMeeting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentMeetingCopyWith<AgentMeeting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentMeetingCopyWith<$Res> {
  factory $AgentMeetingCopyWith(
          AgentMeeting value, $Res Function(AgentMeeting) then) =
      _$AgentMeetingCopyWithImpl<$Res, AgentMeeting>;
  @useResult
  $Res call(
      {num createdAt,
      num id,
      List<String> meetingLocations,
      num meetingTime,
      num meetingEndTime,
      num estimatedBudget,
      num estimatedBudgetInBdt,
      num hourBooked,
      User agent});

  $UserCopyWith<$Res> get agent;
}

/// @nodoc
class _$AgentMeetingCopyWithImpl<$Res, $Val extends AgentMeeting>
    implements $AgentMeetingCopyWith<$Res> {
  _$AgentMeetingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgentMeeting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? meetingLocations = null,
    Object? meetingTime = null,
    Object? meetingEndTime = null,
    Object? estimatedBudget = null,
    Object? estimatedBudgetInBdt = null,
    Object? hourBooked = null,
    Object? agent = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      meetingLocations: null == meetingLocations
          ? _value.meetingLocations
          : meetingLocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      meetingTime: null == meetingTime
          ? _value.meetingTime
          : meetingTime // ignore: cast_nullable_to_non_nullable
              as num,
      meetingEndTime: null == meetingEndTime
          ? _value.meetingEndTime
          : meetingEndTime // ignore: cast_nullable_to_non_nullable
              as num,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as num,
      estimatedBudgetInBdt: null == estimatedBudgetInBdt
          ? _value.estimatedBudgetInBdt
          : estimatedBudgetInBdt // ignore: cast_nullable_to_non_nullable
              as num,
      hourBooked: null == hourBooked
          ? _value.hourBooked
          : hourBooked // ignore: cast_nullable_to_non_nullable
              as num,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of AgentMeeting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get agent {
    return $UserCopyWith<$Res>(_value.agent, (value) {
      return _then(_value.copyWith(agent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgentMeetingImplCopyWith<$Res>
    implements $AgentMeetingCopyWith<$Res> {
  factory _$$AgentMeetingImplCopyWith(
          _$AgentMeetingImpl value, $Res Function(_$AgentMeetingImpl) then) =
      __$$AgentMeetingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num createdAt,
      num id,
      List<String> meetingLocations,
      num meetingTime,
      num meetingEndTime,
      num estimatedBudget,
      num estimatedBudgetInBdt,
      num hourBooked,
      User agent});

  @override
  $UserCopyWith<$Res> get agent;
}

/// @nodoc
class __$$AgentMeetingImplCopyWithImpl<$Res>
    extends _$AgentMeetingCopyWithImpl<$Res, _$AgentMeetingImpl>
    implements _$$AgentMeetingImplCopyWith<$Res> {
  __$$AgentMeetingImplCopyWithImpl(
      _$AgentMeetingImpl _value, $Res Function(_$AgentMeetingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgentMeeting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? meetingLocations = null,
    Object? meetingTime = null,
    Object? meetingEndTime = null,
    Object? estimatedBudget = null,
    Object? estimatedBudgetInBdt = null,
    Object? hourBooked = null,
    Object? agent = null,
  }) {
    return _then(_$AgentMeetingImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num,
      meetingLocations: null == meetingLocations
          ? _value._meetingLocations
          : meetingLocations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      meetingTime: null == meetingTime
          ? _value.meetingTime
          : meetingTime // ignore: cast_nullable_to_non_nullable
              as num,
      meetingEndTime: null == meetingEndTime
          ? _value.meetingEndTime
          : meetingEndTime // ignore: cast_nullable_to_non_nullable
              as num,
      estimatedBudget: null == estimatedBudget
          ? _value.estimatedBudget
          : estimatedBudget // ignore: cast_nullable_to_non_nullable
              as num,
      estimatedBudgetInBdt: null == estimatedBudgetInBdt
          ? _value.estimatedBudgetInBdt
          : estimatedBudgetInBdt // ignore: cast_nullable_to_non_nullable
              as num,
      hourBooked: null == hourBooked
          ? _value.hourBooked
          : hourBooked // ignore: cast_nullable_to_non_nullable
              as num,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentMeetingImpl implements _AgentMeeting {
  const _$AgentMeetingImpl(
      {this.createdAt = 0,
      this.id = 0,
      final List<String> meetingLocations = const [],
      this.meetingTime = 0,
      this.meetingEndTime = 0,
      this.estimatedBudget = 0,
      this.estimatedBudgetInBdt = 0,
      this.hourBooked = 0,
      this.agent = const User()})
      : _meetingLocations = meetingLocations;

  factory _$AgentMeetingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentMeetingImplFromJson(json);

  @override
  @JsonKey()
  final num createdAt;
  @override
  @JsonKey()
  final num id;
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
  final num meetingEndTime;
  @override
  @JsonKey()
  final num estimatedBudget;
  @override
  @JsonKey()
  final num estimatedBudgetInBdt;
  @override
  @JsonKey()
  final num hourBooked;
  @override
  @JsonKey()
  final User agent;

  @override
  String toString() {
    return 'AgentMeeting(createdAt: $createdAt, id: $id, meetingLocations: $meetingLocations, meetingTime: $meetingTime, meetingEndTime: $meetingEndTime, estimatedBudget: $estimatedBudget, estimatedBudgetInBdt: $estimatedBudgetInBdt, hourBooked: $hourBooked, agent: $agent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentMeetingImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._meetingLocations, _meetingLocations) &&
            (identical(other.meetingTime, meetingTime) ||
                other.meetingTime == meetingTime) &&
            (identical(other.meetingEndTime, meetingEndTime) ||
                other.meetingEndTime == meetingEndTime) &&
            (identical(other.estimatedBudget, estimatedBudget) ||
                other.estimatedBudget == estimatedBudget) &&
            (identical(other.estimatedBudgetInBdt, estimatedBudgetInBdt) ||
                other.estimatedBudgetInBdt == estimatedBudgetInBdt) &&
            (identical(other.hourBooked, hourBooked) ||
                other.hourBooked == hourBooked) &&
            (identical(other.agent, agent) || other.agent == agent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      id,
      const DeepCollectionEquality().hash(_meetingLocations),
      meetingTime,
      meetingEndTime,
      estimatedBudget,
      estimatedBudgetInBdt,
      hourBooked,
      agent);

  /// Create a copy of AgentMeeting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentMeetingImplCopyWith<_$AgentMeetingImpl> get copyWith =>
      __$$AgentMeetingImplCopyWithImpl<_$AgentMeetingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentMeetingImplToJson(
      this,
    );
  }
}

abstract class _AgentMeeting implements AgentMeeting {
  const factory _AgentMeeting(
      {final num createdAt,
      final num id,
      final List<String> meetingLocations,
      final num meetingTime,
      final num meetingEndTime,
      final num estimatedBudget,
      final num estimatedBudgetInBdt,
      final num hourBooked,
      final User agent}) = _$AgentMeetingImpl;

  factory _AgentMeeting.fromJson(Map<String, dynamic> json) =
      _$AgentMeetingImpl.fromJson;

  @override
  num get createdAt;
  @override
  num get id;
  @override
  List<String> get meetingLocations;
  @override
  num get meetingTime;
  @override
  num get meetingEndTime;
  @override
  num get estimatedBudget;
  @override
  num get estimatedBudgetInBdt;
  @override
  num get hourBooked;
  @override
  User get agent;

  /// Create a copy of AgentMeeting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentMeetingImplCopyWith<_$AgentMeetingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
