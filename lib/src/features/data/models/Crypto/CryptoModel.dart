import 'package:flutter/material.dart';

class CryptoModel {
  final String name;
  final String symbol;
  final String price;
  final String percentageChange;
  final Color backgroundColor;
  final Color iconBackground;
  final Color iconColor;
  final IconData icon;
  final Color chartColor;
  final Color changeColor;
  final List<double> chartPoints;

  CryptoModel({
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentageChange,
    required this.backgroundColor,
    required this.iconBackground,
    required this.iconColor,
    required this.icon,
    required this.chartColor,
    required this.changeColor,
    required this.chartPoints,
  });
}