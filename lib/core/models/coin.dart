/// Coin price status.
enum CoinPriceTrend {
  /// Price decreases.
  fall,

  /// Price increases.
  rise
}

/// Coin model.
class Coin {
  /// Coin name.
  final String name;

  /// Icon image url.
  final String iconImageUrl;

  /// Icon price.
  final double price;

  /// Coin price trend.
  CoinPriceTrend coinPriceTrend;

  /// Creates coin.
  Coin({
    required this.name,
    required this.iconImageUrl,
    required this.price,
    required this.coinPriceTrend,
  });

  /// Creates coin from json.
  Coin.fromJson(Map<String, dynamic> json)
      : name = 'XRP',
        coinPriceTrend = _getCoinTrend(json),
        iconImageUrl = 'assets/xrp_logo.svg',
        price = double.tryParse(json['c']) ?? 0
  ;

  /// Deserializes json to [CoinPriceTrend].
  static CoinPriceTrend _getCoinTrend(Map<String, dynamic> json) {
    final double lowestPrice = double.tryParse(json['o']) ?? 0;
    final double highestPrice = double.tryParse(json['h']) ?? 0;
    final double currentPrice = double.tryParse(json['c']) ?? 0;

    if (highestPrice - currentPrice < currentPrice - lowestPrice) {
      return CoinPriceTrend.rise;
    } else {
      return CoinPriceTrend.fall;
    }
  }
}