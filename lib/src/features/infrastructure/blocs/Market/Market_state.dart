import '../../../data/models/Crypto/CryptoModel.dart';

abstract class MarketState {}

class MarketInitial extends MarketState {}

class MarketLoading extends MarketState {}

class MarketLoaded extends MarketState {
  final List<CryptoModel> cryptoData;

  MarketLoaded({required this.cryptoData});
}

class MarketError extends MarketState {
  final String message;

  MarketError({required this.message});
}