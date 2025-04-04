import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/blocs/TimeRange/index.dart';

class Timerangebuttonwidget extends StatelessWidget {
  final String text;
  const Timerangebuttonwidget({super.key, required this.text, this.isActive = false});
 final bool isActive;

 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TimeRangeBloc>().add(
              ChangeTimeRange(
                text == 'Day'
                    ? TimeRange.day
                    : text == 'Week'
                        ? TimeRange.week
                        : text == 'Month'
                            ? TimeRange.month
                            : TimeRange.year,
              ),
            );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.blue : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}