import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'src/features/infrastructure/blocs.dart';
import 'src/features/infrastructure/blocs/sliderbar/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MarketBloc>(
          create: (context) => MarketBloc()..add(FetchMarketData()),
        ),
        BlocProvider<PortfolioBloc>(
          create: (context) => PortfolioBloc()..add(FetchPortfolioData()),
        ),
        BlocProvider<TimeRangeBloc>(
          create: (context) => TimeRangeBloc(),
        ),
        BlocProvider<SidebarBloc>(
          create: (context) => SidebarBloc(),
        ),
      ],
      child: const CryptoDashboardApp(),
    ),
  );
}