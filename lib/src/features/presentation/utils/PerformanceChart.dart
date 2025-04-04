import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/blocs/TimeRange/index.dart';

class PerformanceChart extends StatefulWidget {
  final TimeRange timeRange;

  const PerformanceChart({
    super.key,
    required this.timeRange,
  });

  @override
  State<PerformanceChart> createState() => _PerformanceChartState();
}

class _PerformanceChartState extends State<PerformanceChart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(PerformanceChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.timeRange != widget.timeRange) {
      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<FlSpot> _generateSpots() {
    switch (widget.timeRange) {
      case TimeRange.day:
        return [
          const FlSpot(0, 5),
          const FlSpot(1, 4),
          const FlSpot(2, 7),
          const FlSpot(3, 3),
          const FlSpot(4, 5),
          const FlSpot(5, 8),
          const FlSpot(6, 6),
        ];
      case TimeRange.week:
        return [
          const FlSpot(0, 6),
          const FlSpot(1, 7),
          const FlSpot(2, 5),
          const FlSpot(3, 4),
          const FlSpot(4, 8),
          const FlSpot(5, 9),
          const FlSpot(6, 7),
        ];
      case TimeRange.month:
        return [
          const FlSpot(0, 3),
          const FlSpot(1, 5),
          const FlSpot(2, 8),
          const FlSpot(3, 7),
          const FlSpot(4, 4),
          const FlSpot(5, 6),
          const FlSpot(6, 5),
        ];
      case TimeRange.year:
        return [
          const FlSpot(0, 4),
          const FlSpot(1, 6),
          const FlSpot(2, 3),
          const FlSpot(3, 8),
          const FlSpot(4, 9),
          const FlSpot(5, 7),
          const FlSpot(6, 10),
        ]; 
    }}

     @override
  Widget build(BuildContext context) {
    final spots = _generateSpots();
    
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                getTooltipColor: (LineBarSpot spot) => Colors.blueAccent.withOpacity(0.8),
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((spot) {
                    return LineTooltipItem(
                      '+3.2%',
                      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }).toList();
                },
              ),
              handleBuiltInTouches: true,
              touchSpotThreshold: 20,
            ),
            gridData: FlGridData(
              show: false,
            ),
            titlesData: FlTitlesData(
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    String text = '';
                    switch (value.toInt()) {
                      case 0:
                        text = 'Nov';
                        break;
                      case 1:
                        text = 'Dec';
                        break;
                      case 2:
                        text = 'Jan';
                        break;
                      case 3:
                        text = 'Feb';
                        break;
                      case 4:
                        text = 'Mar';
                        break;
                      case 5:
                        text = 'Apr';
                        break;
                      case 6:
                        text = 'May';
                        break;
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: spots
                    .map((spot) => FlSpot(
                          spot.x,
                          spot.y * _animation.value,
                        ))
                    .toList(),
                isCurved: true,
                color: Colors.blue,
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    // Create hotspots
                    const hotspots = [0, 2, 4, 5];
                    if (hotspots.contains(index)) {
                      return FlDotCirclePainter(
                        radius: 6,
                        color: Colors.white,
                        strokeWidth: 2,
                        strokeColor: Colors.blue,
                      );
                    }
                    // Small dots
                    return FlDotCirclePainter(
                      radius: 2,
                      color: Colors.grey,
                      strokeWidth: 0,
                      strokeColor: Colors.transparent,
                    );
                  },
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.1),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.2),
                      Colors.blue.withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 10,
          ),
        );
      },
    );
  }
}