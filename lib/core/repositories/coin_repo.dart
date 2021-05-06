import 'dart:async';

import '../api/coin_api.dart';

class CoinRepo {
  final CoinApi _coinApi = CoinApi();
  late Stream coinPriceStream;

  Stream getCoinPriceStream() {
    return _coinApi.requestCoinPriceStreamConnection();
  }

}