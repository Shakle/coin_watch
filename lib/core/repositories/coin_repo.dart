import '../api/coin_api.dart';
import '../models/coin.dart';

class CoinRepo {
  final CoinApi _coinApi = CoinApi();

  double lastPrice = 0;

  Future<Coin?> getCoin() async {
    return await _coinApi.requestCoinInfo();
  }

  void _setLastPrice(Coin coin) {
    lastPrice = coin.price;
  }

  CoinStatus _getCoinStatus(Coin coin) {
    if (coin.price > lastPrice) {
      return CoinStatus.up;
    } else if (coin.price < lastPrice) {
      return CoinStatus.down;
    } else {
      return CoinStatus.flat;
    }
  }

  Coin getCoinWithUpdatedStatus(Coin coin) {
    coin.coinStatus = _getCoinStatus(coin);
    _setLastPrice(coin);
    return coin;
  }

}