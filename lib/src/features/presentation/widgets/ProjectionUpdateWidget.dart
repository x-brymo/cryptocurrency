import 'package:flutter/material.dart';

class ProjectionUpdateWidget extends StatelessWidget {
  const ProjectionUpdateWidget({super.key, required this.icon, required this.color, required this.percentage, required this.description});
 final IconData icon;
    final Color color;
    final String percentage;
    final String description;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),
      tileColor: Colors.white,
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: color.withOpacity(0.1),
        child: Icon(
          Icons.currency_bitcoin,
          color: color,
          size: 16,
        ),
      ),
      title: Column(
        children: [
          Text(
            percentage,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
    // Container(
    //   padding: const EdgeInsets.all(16),
    //   decoration: BoxDecoration(
    //     color: Colors.grey.withOpacity(0.1),
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    //   child: Row(
    //     children: [
    //       CircleAvatar(
    //         radius: 16,
    //         backgroundColor: Colors.blue.withOpacity(0.1),
    //         child: Icon(
    //           Icons.currency_bitcoin,
    //           color: Colors.orange,
    //           size: 16,
    //         ),
    //       ),
    //       const SizedBox(width: 12),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               Icon(
    //                 icon,
    //                 color: color,
    //                 size: 16,
    //               ),
    //               const SizedBox(width: 4),
    //               Text(
    //                 percentage,
    //                 style: TextStyle(
    //                   color: color,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Text(
    //             description,
    //             style: TextStyle(
    //               fontSize: 12,
    //               color: Colors.grey,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  

  }
}