import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sheba_plus/models/user/user.dart';

part 'agent_meeting.freezed.dart';
part 'agent_meeting.g.dart';

@freezed
class AgentMeeting with _$AgentMeeting {
  const factory AgentMeeting({
    @Default(0) num createdAt,
    @Default(0) num id,
    @Default([]) List<String> meetingLocations,
    @Default(0) num meetingTime,
    @Default(0) num meetingEndTime,
    @Default(0) num estimatedBudget,
    @Default(0) num estimatedBudgetInBdt,
    @Default(0) num hourBooked,
    @Default(User()) User agent,
  }) = _AgentMeeting;

  factory AgentMeeting.fromJson(Map<String, dynamic> json) => _$AgentMeetingFromJson(json);
}
