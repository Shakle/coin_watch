class CoinEvent {}

class CoinRequested extends CoinEvent {}
class CoinReceived extends CoinEvent {
  final String json;

  CoinReceived({required this.json});
}
