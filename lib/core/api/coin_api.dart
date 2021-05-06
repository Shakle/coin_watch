import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'database_api.dart';

class CoinApi extends DataBaseApi {
  final String _streamDomain = 'wss://stream.binance.com:9443/ws';
  final String _streamName = 'xrpusdt@miniTicker';

  Stream requestCoinPriceStreamConnection() {
    final WebSocketChannel priceChannel = IOWebSocketChannel.connect('$_streamDomain/$_streamName');
    return priceChannel.stream;
  }
  
}