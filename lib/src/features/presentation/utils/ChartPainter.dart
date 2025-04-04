import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final List<double> points;
  final Color color;

  ChartPainter({
    required this.points,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final width = size.width;
    final height = size.height;
    final xStep = width / (points.length - 1);

    double minPoint = points.reduce((a, b) => a < b ? a : b);
    double maxPoint = points.reduce((a, b) => a > b ? a : b);
    double range = maxPoint - minPoint;

    if (range == 0) range = 1;

    path.moveTo(0, height - ((points[0] - minPoint) / range * height));

    for (int i = 1; i < points.length; i++) {
      path.lineTo(
        i * xStep,
        height - ((points[i] - minPoint) / range * height),
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}