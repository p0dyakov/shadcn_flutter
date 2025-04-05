import 'package:shadcn_flutter/shadcn_flutter.dart';

class TimeOfDay {
  final int hour;
  final int minute;
  final int second;

  const TimeOfDay({
    required this.hour,
    required this.minute,
    this.second = 0,
  });

  const TimeOfDay.pm({
    required int hour,
    required this.minute,
    this.second = 0,
  }) : hour = hour + 12;

  const TimeOfDay.am({
    required this.hour,
    required this.minute,
    this.second = 0,
  });

  TimeOfDay.fromDateTime(DateTime dateTime)
      : hour = dateTime.hour,
        minute = dateTime.minute,
        second = dateTime.second;

  TimeOfDay.fromDuration(Duration duration)
      : hour = duration.inHours,
        minute = duration.inMinutes % 60,
        second = duration.inSeconds % 60;

  TimeOfDay.now() : this.fromDateTime(DateTime.now());

  TimeOfDay copyWith({
    int? hour,
    int? minute,
    int? second,
  }) {
    return TimeOfDay(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
    );
  }

  TimeOfDay replacing({
    int? hour,
    int? minute,
    int? second,
  }) {
    return TimeOfDay(
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      second: second ?? this.second,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TimeOfDay && other.hour == hour && other.minute == minute && other.second == second;
  }

  @override
  int get hashCode => Object.hash(hour, minute, second);

  @override
  String toString() {
    return 'TimeOfDay{hour: $hour, minute: $minute, second: $second}';
  }
}

(bool enabled, Object? invokeResult) invokeActionOnFocusedWidget(Intent intent) {
  final context = primaryFocus?.context;
  if (context != null) {
    Action<Intent>? action = Actions.maybeFind<Intent>(context, intent: intent);
    if (action != null) {
      final (bool enabled, Object? invokeResult) = Actions.of(context).invokeActionIfEnabled(action, intent);
      return (enabled, invokeResult);
    }
  }
  return (false, null);
}
