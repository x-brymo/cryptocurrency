import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/blocs/TimeRange/index.dart';
import 'TimeRangeButtonWidget.dart';

class Timerangeselectorwidget extends StatelessWidget {
  const Timerangeselectorwidget({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<TimeRangeBloc, TimeRangeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Timerangebuttonwidget(text: 'Day', isActive: state.range == TimeRange.day),
             Timerangebuttonwidget(text: 'Week', isActive: state.range == TimeRange.week),
             Timerangebuttonwidget(text: 'Month', isActive: state.range == TimeRange.month),
             Timerangebuttonwidget(text: 'Year', isActive: state.range == TimeRange.year),
              IconButton(
                icon: const Icon(Icons.calendar_today_outlined, size: 20),
                onPressed: () {
                  
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      BlocProvider.of<TimeRangeBloc>(context).add(DateSelected(selectedDate));
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}