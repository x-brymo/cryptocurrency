import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';

import 'ProjectionItemWidget.dart';
import 'ProjectionUpdateWidget.dart';

class ProjectionsCardWidget extends StatelessWidget {
  const ProjectionsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
       width: context.screenWidth * 0.120,
       decoration: BoxDecoration(
         color: Colors.transparent,
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
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text(
                   'Projections',
                   style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 IconButton(
                   icon: const Icon(Icons.more_horiz),
                   onPressed: () {},
                 ),
               ],
             ),
             const SizedBox(height: 20),
             ProjectionItemWidget(),
             const SizedBox(height: 12),
             ProjectionUpdateWidget(
               icon: Icons.trending_down,
               color: Colors.red,
               percentage: '-4.12%',
               description: 'There has been a sharp increase of',
             ),
             const SizedBox(height: 12),
             ProjectionUpdateWidget(
               icon: Icons.trending_up,
               color: Colors.green,
               percentage: '+9.60%',
               description: 'There has been a sharp increase of',
             ),
           ],
         ),
       ),
     );}
}