import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/features/presentation/pages/layout/layout.dart';

class CryptoDashboardApp extends StatelessWidget {
  const CryptoDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return  Scaffold(
              body: SafeArea(
                child: Center(
                  child: Container(
                    child: Row(
                      children: [
                        Text('Mobile View'),
                        Text(' 600'),
                        
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (constraints.maxWidth < 1200) {
            return  Scaffold(
              body: SafeArea(
                child: Center(
                  child: Container(
                    child: Row(
                      children: [
                       Text('Desktop View'),
                       Text(' 1200'),
                        
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (constraints.maxWidth >= 1300) {
            return const DashboardScreen();
          } else {
            return DashboardScreen();
          }
        },
      ),
        
     // const DashboardScreen(),
    );
  }
}