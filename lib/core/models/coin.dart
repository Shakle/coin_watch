enum CoinStatus {down, up}

class Coin {
  final String symbol;
  final String iconUrl;
  final double price;
  CoinStatus coinStatus;

  Coin({
    required this.symbol,
    required this.iconUrl,
    required this.price,
    required this.coinStatus,
  });

  Coin.fromJson(Map<String, dynamic> json)
      : symbol = 'XRP',
        coinStatus = _getCoinStatus(double.parse(json['o']), double.parse(json['h']), double.parse(json['c'])),
        iconUrl = 'assets/xrp_logo.svg',
        price = double.parse(json['c'])
  ;

  static CoinStatus _getCoinStatus(double lowestPrice, double highestPrice, double currentPrice) {
    if (highestPrice - currentPrice < currentPrice - lowestPrice) {
      return CoinStatus.up;
    } else {
      return CoinStatus.down;
    }
  }
}