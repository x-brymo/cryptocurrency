import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';

import '../../data/models/Crypto/CryptoModel.dart';
import '../utils/ChartPainter.dart';

class CryptoCardWidget extends StatelessWidget {
  final CryptoModel coin;

  const CryptoCardWidget({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
     final kIconSize = 25.0;
    return Container(
      width: context.screenWidth * 0.130,
      height: context.screenHeight * 0.045,
      decoration: BoxDecoration(
        color: coin.backgroundColor,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: kIconSize,
              height: kIconSize,
              decoration: BoxDecoration(
                color: coin.iconBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(coin.icon, color: coin.iconColor, size: kIconSize-8),
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        coin.price,
                        style: TextStyle(
                          color: coin.changeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        coin.symbol,
                        style: TextStyle(color: Colors.grey[600], fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        coin.percentageChange,
                        style: TextStyle(
                          color: coin.changeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: ClipRect(
                          child: SizedBox(
                            width: context.screenWidth * 0.020,

                            child: CustomPaint(
                              painter: ChartPainter(
                                points: coin.chartPoints,
                                color: coin.chartColor,
                              ),
                              size: const Size(double.infinity, 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
