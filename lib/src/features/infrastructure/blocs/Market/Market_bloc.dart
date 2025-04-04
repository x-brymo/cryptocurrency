import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/Crypto/CryptoModel.dart';
import 'index.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketInitial()) {
    on<FetchMarketData>((event, emit) async {
      emit(MarketLoading());
      try {
        // Simulate API call
        await Future.delayed(const Duration(milliseconds: 500));
        
        final data = [
          CryptoModel(
            name: 'Bitcoin',
            symbol: 'BTC',
            price: '32,234',
            percentageChange: '+9.60%',
            backgroundColor: Colors.black,
            iconBackground: Colors.orange.withOpacity(0.8),
            iconColor: Colors.white,
            icon: Icons.currency_bitcoin,
            chartColor: Colors.green,
            changeColor: Colors.green,
            chartPoints: [5.0, 6.0, 5.5, 7.0, 6.5, 7.5, 8.0],
          ),
          CryptoModel(
            name: 'Ethereum',
            symbol: 'ETH',
            price: '380.58',
            percentageChange: '-4.12%',
            backgroundColor: Colors.white,
            iconBackground: Colors.purple.withOpacity(0.8),
            iconColor: Colors.white,
            icon: Icons.attach_money,
            chartColor: Colors.red,
            changeColor: Colors.red,
            chartPoints: [7.0, 6.5, 6.0, 5.5, 5.0, 4.5, 4.0],
          ),
          CryptoModel(
            name: 'Tether',
            symbol: 'USDT',
            price: '4.8005',
            percentageChange: '+9.48%',
            backgroundColor: Colors.white,
            iconBackground: Colors.teal.withOpacity(0.8),
            iconColor: Colors.white,
            icon: Icons.attach_money,
            chartColor: Colors.green,
            changeColor: Colors.green,
            chartPoints: [5.0, 5.0, 5.2, 5.1, 5.3, 5.4, 5.5],
          ),
          CryptoModel(
            name: 'Binance Coin',
            symbol: 'BNB',
            price: '547.23',
            percentageChange: '+0.81%',
            backgroundColor: Colors.white,
            iconBackground: Colors.amber.withOpacity(0.8),
            iconColor: Colors.black,
            icon: Icons.money,
            chartColor: Colors.green,
            changeColor: Colors.green,
            chartPoints: [6.0, 6.2, 6.1, 6.3, 6.2, 6.4, 6.5],
          ),
        ];
        
        emit(MarketLoaded(cryptoData: data));
      } catch (e) {
        emit(MarketError(message: e.toString()));
      }
    });
  }
}