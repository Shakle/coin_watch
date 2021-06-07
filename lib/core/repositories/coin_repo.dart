import 'dart:async';

import '../api/coin_api.dart';

/// Repository for coin.
/// Consists of methods for [Coin].
class CoinRepo {
  final CoinApi _coinApi = CoinApi();

  /// Returns coin price [Stream].
  Stream getCoinPriceStream() {
    return _coinApi.requestCoinPriceStreamConnection();
  }

}