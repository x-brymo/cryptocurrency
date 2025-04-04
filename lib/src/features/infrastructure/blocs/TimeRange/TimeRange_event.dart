enum TimeRange { day, week, month, year }

// TimeRange Events
abstract class TimeRangeEvent {}

class ChangeTimeRange extends TimeRangeEvent {
  final TimeRange range;

  ChangeTimeRange(this.range);
}
class DateSelected extends TimeRangeEvent {
  final DateTime selectedDate;

  DateSelected(this.selectedDate);

}