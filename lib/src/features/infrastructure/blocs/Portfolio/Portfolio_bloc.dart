import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/Asset/AssetModel.dart';
import 'index.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(PortfolioInitial()) {
    on<FetchPortfolioData>((event, emit) async {
      emit(PortfolioLoading());
      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 5));
        final assets = [
          AssetModel(
            name: 'Bitcoin',
            symbol: 'BTC',
            amount: 1.529,
            price: 45232.92,
            value: 87471.98,
            change1h: 14.72,
            change24h: 1.36,
          ),
          AssetModel(
            name: 'Ethereum',
            symbol: 'ETH',
            amount: 97.25,
            price: 6216.54,
            value: 12921.64,
            change1h: 15.63,
            change24h: 3.74,
          ),
          AssetModel(
            name: 'Litecoin',
            symbol: 'LTC',
            amount: 0.45,
            price: 33547.20,
            value: 53542.87,
            change1h: 12.76,
            change24h: 7.23,
          ),
        ];
        
        double totalValue = assets.fold(
          0,
          (sum, asset) => sum + asset.value,
        );
        
        emit(PortfolioLoaded(
          assets: assets,
          totalValue: totalValue,
        ));
      } catch (e) {
        emit(PortfolioError(message: e.toString()));
      }
    });
  }
}