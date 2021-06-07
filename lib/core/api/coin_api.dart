import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// API for coin requests
class CoinApi {
  final String _streamDomain = 'wss://stream.binance.com:9443/ws';
  final String _streamName = 'xrpusdt@miniTicker';

  /// Returns coin price stream
  Stream requestCoinPriceStreamConnection() {
    final WebSocketChannel priceChannel = IOWebSocketChannel.connect('$_streamDomain/$_streamName');
    return priceChannel.stream;
  }
  
}