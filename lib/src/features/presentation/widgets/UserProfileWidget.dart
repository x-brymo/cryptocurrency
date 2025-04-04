import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptocurrency/core/index.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
           height: 100,
            width: context.screenWidth * 0.180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                   showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                         backgroundColor: Colors.transparent,
                          content:Image(
                            image: CachedNetworkImageProvider(
                              'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/487815123_4029561320696619_8164544863936225520_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=_KU3QTpyb2cQ7kNvgGzGEMG&_nc_oc=AdkBe_BXUSxjCw38t3rrl-BqnKGHyodAIE907zqM5tYy_F_SqtZaXhgY4RuBQ0KaiGM&_nc_zt=23&_nc_ht=scontent.fcai19-12.fna&_nc_gid=9713SryVlYcJzPJ05-PcPg&oh=00_AYH9n5RETSrjfx_QoTSrgE6RwQ7V--CuHhL-S7vG0ICxsg&oe=67F44345',
                            
                            errorListener: (__) {
                              print('Error loading image');
                            },
                          )) ,
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: CachedNetworkImageProvider(
                      'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/487815123_4029561320696619_8164544863936225520_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=_KU3QTpyb2cQ7kNvgGzGEMG&_nc_oc=AdkBe_BXUSxjCw38t3rrl-BqnKGHyodAIE907zqM5tYy_F_SqtZaXhgY4RuBQ0KaiGM&_nc_zt=23&_nc_ht=scontent.fcai19-12.fna&_nc_gid=9713SryVlYcJzPJ05-PcPg&oh=00_AYH9n5RETSrjfx_QoTSrgE6RwQ7V--CuHhL-S7vG0ICxsg&oe=67F44345',
                    errorListener: (__) {
                      print('Error loading image');
                    },
                    )
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Mahmoud',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Premium',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Icon(Icons.edit, size: 16),
              ],
            ),
          ),
        ],
      ),
   );
  }
}