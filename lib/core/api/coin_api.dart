import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/coin.dart';
import 'database_api.dart';

class CoinApi extends DataBaseApi {
  final String _binanceDomain = 'api.binance.com';
  final String _prices = 'api/v3/ticker/price';

  Future<Coin?> requestCoinInfo() async {
    final Map<String, dynamic> priceQueryParams = {
      'symbol': 'XRPUSDT',
    };

    final http.Response priceResponse = await http.get(Uri.https(_binanceDomain, _prices, priceQueryParams));

    if (priceResponse.statusCode == 200) {
      return Coin.fromJson(jsonDecode(priceResponse.body));
    } else {
      return null;
    }
  }
  
}