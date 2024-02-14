class TimerModel {
  int millisecond;
  int second;
  int minute;
  int hour;
  TimerModel(
      {required this.millisecond,
      required this.second,
      required this.minute,
      required this.hour});

  TimerModel copyWith({
    int? millisecond,
    int? second,
    int? minute,
    int? hour,
  }) {
    return TimerModel(
      millisecond: millisecond ?? this.millisecond,
      second: second ?? this.second,
      minute: minute ?? this.minute,
      hour: hour ?? this.hour,
    );
  }
}
