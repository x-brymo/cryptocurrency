import 'index.dart';

class TimeRangeState {
  final TimeRange? range;

  TimeRangeState({this.range});
}
class DateSelected extends TimeRangeState{
  final DateTime selectedDate;

  DateSelected(this.selectedDate) : super(range: null);

  @override
  List<Object> get props => [selectedDate];
}