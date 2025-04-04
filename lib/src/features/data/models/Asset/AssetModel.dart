class AssetModel {
  final String name;
  final String symbol;
  final double amount;
  final double price;
  final double value;
  final double change1h;
  final double change24h;

  AssetModel({
    required this.name,
    required this.symbol,
    required this.amount,
    required this.price,
    required this.value,
    required this.change1h,
    required this.change24h,
  });
}
