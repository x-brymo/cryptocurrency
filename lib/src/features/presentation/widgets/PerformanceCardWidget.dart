import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/blocs/TimeRange/index.dart';
import '../utils/PerformanceChart.dart';

class PerformanceCardWidget extends StatelessWidget {
  const PerformanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeRangeBloc, TimeRangeState>(
      builder: (context, timeState) {
        return Container(
          width: context.screenWidth * 0.470,
          height: context.screenHeight * 0.40,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Performance',
                    style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      foregroundColor: Colors.blue,
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                    child: const Text('Portfolio Review'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: context.screenHeight * 0.25,
                width: context.screenWidth,
                child: PerformanceChart(timeRange: timeState.range!),
              ),
            ],
          ),
        );
      },
    );
  }
}