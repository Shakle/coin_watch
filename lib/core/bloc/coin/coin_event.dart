part of 'coin_bloc.dart';

/// Coin event base class
abstract class CoinEvent {}

/// Event for coin request
class CoinRequested extends CoinEvent {}

/// Event for coin received
class CoinReceived extends CoinEvent {
  /// Json from response
  final String json;

  /// Accepts json in constructor
  CoinReceived({required this.json});
}
