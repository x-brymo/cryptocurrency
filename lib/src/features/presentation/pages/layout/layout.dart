// DASHBOARD MAIN SCREEN
import 'package:cryptocurrency/core/index.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/blocs/sliderbar/index.dart';
import '../../widgets/AnalysisCardWidget.dart';
import '../../widgets/CoinCardsWidget.dart';
import '../../widgets/HeaderWidget.dart';
import '../../widgets/PerformanceCardWidget.dart';
import '../../widgets/PortfolioCardWidget.dart';
import '../../widgets/ProjectionsCardWidget.dart';
import '../../widgets/SliderbarWidget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6F6F6),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 75,
            height: context.screenHeight,
            child: SliderBarWidget(),
          ),

          // باقي الشاشة
          Expanded(child: ContentArea()),
        ],
      ),
    );
  }
}

class ContentArea extends StatelessWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarBloc, SidebarState>(
      builder: (context, selectedIndex) {
        List<Widget> screens = [
          HomeScreen(),
          Center(child: Text("Grid View", style: TextStyle(fontSize: 24))),
          Center(
            child: Text("People Management", style: TextStyle(fontSize: 24)),
          ),
          Center(child: Text("Settings", style: TextStyle(fontSize: 24))),
        ];

        return screens[selectedIndex.index];
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Headerwidget(),
          SizedBox(height: context.screenHeight * 0.02),
          CoinCardsWidget(animationController: _animationController),
          SizedBox(height: context.screenHeight * 0.02),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      PerformanceCardWidget(),
                      SizedBox(height: context.screenHeight * 0.016),
                      PortfolioCardWidget(),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: context.screenWidth * 0.220,
                  height: context.screenHeight * 40,
                  child: ListView(
                    children: [
                      AnalysisCardWidget(),
                      const SizedBox(height: 16),
                      ProjectionsCardWidget(),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                SizedBox(
                  width: context.screenWidth * 0.140,
                  height: context.screenHeight * 40,
                  child: ListView(
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: Container(
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
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Overview',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.widgets_rounded,
                                              size: 15,
                                            ),
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                      'Overview',
                                                    ),
                                                    content: const Text(
                                                      'Overview content goes here. You can display dynamic information here.',
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(
                                                            context,
                                                          ).pop();
                                                        },
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          // PieChart
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: PieChart(
                                              PieChartData(
                                                sections: [
                                                  PieChartSectionData(
                                                    value: 30,
                                                    title: '30%',
                                                    color: Colors.blue,
                                                    radius: 40,
                                                    titleStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  PieChartSectionData(
                                                    value: 40,
                                                    title: '40%',
                                                    color: Colors.red,
                                                    radius: 40,
                                                    titleStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  PieChartSectionData(
                                                    value: 30,
                                                    title: '30%',
                                                    color: Colors.green,
                                                    radius: 40,
                                                    titleStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                                sectionsSpace: 0,
                                                centerSpaceRadius: 40,
                                              ),
                                            ),
                                          ),
                                          // Centered Content inside Pie Chart
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Text(
                                                '30%',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'ETH',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // Positioned CircleAvatar with Money Icon
                                          Positioned(
                                            right: 10,
                                            bottom: 10,
                                            child: CircleAvatar(
                                              radius: 16,
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons.attach_money,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        height: 400,
                        width: double.infinity,
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Updates',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.update_rounded,
                                      size: 15,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Updates Version',
                                            ),
                                            content: const Text(
                                              'Updates Version content goes here. You can display dynamic information here.',
                                            ),
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
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                    title: const Text('Sep Month 21 4:12 pm'),
                                    subtitle: const Text(
                                      'We Pushed on update adding icons and modify in theme app',
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('Sep Month 24 6:12 pm'),
                                    subtitle: const Text(
                                      'We Pushed on update adding icons and modify in theme app',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 35),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
