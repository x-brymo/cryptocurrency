import 'package:flutter/material.dart';

import 'AnalysisItemWidget.dart';

class AnalysisCardWidget extends StatelessWidget {
  const AnalysisCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
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
          const Text(
            'Analysis',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          AnalysisItemWidget(label: 'Dump', percentage: 84, color: Colors.blue),
          AnalysisItemWidget(label: 'Pump', percentage: 67, color: Colors.purple),
          AnalysisItemWidget(label: 'Slow Investment', percentage: 98, color: Colors.deepPurple),
          AnalysisItemWidget(label: 'Social', percentage: 33, color: Colors.red),
          const SizedBox(height: 20),
          
        ],
      ),
    );
  }
}