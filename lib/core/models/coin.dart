enum CoinStatus {down, flat, up}

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
        coinStatus = CoinStatus.flat,
        iconUrl = 'assets/xrp_logo.svg',
        price = double.parse(json['price'])
  ;
}