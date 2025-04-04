import '../../../data/models/Asset/AssetModel.dart';

abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<AssetModel> assets;
  final double totalValue;

  PortfolioLoaded({
    required this.assets,
    required this.totalValue,
  });
}

class PortfolioError extends PortfolioState {
  final String message;

  PortfolioError({required this.message});
}
