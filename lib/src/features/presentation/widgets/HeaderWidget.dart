import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';

import 'TimeRangeSelectorWidget.dart';
import 'UserProfileWidget.dart';

class Headerwidget extends StatelessWidget {
  const Headerwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good morning, Mahmoud Hafez',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  'Market has been ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'growing',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
                Text(
                  ' in volume at rate of ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '2.3%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
       SizedBox(width: context.screenWidth * 0.02),
        Row(
          children: [
            Timerangeselectorwidget(),
            const SizedBox(width: 100),
            UserProfileWidget(),
          ],
        ),
      ],
    );
  }
}