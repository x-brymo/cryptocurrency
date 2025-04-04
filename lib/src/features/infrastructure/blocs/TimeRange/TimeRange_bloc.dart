import 'index.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimeRangeBloc extends Bloc<TimeRangeEvent, TimeRangeState> {
  TimeRangeBloc() : super(TimeRangeState(range: TimeRange.week)) {
    on<ChangeTimeRange>((event, emit) {
      emit(TimeRangeState(range: event.range));
    });
    on<DateSelected>((event, emit) {
      emit(DateSelected(event.selectedDate) as TimeRangeState);
    });
  }
}
