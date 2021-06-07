part of 'coin_bloc.dart';

/// Base coin state
abstract class CoinState {}

/// Initial coin state
class CoinInitial extends CoinState {}

/// Coin is loading state
class CoinLoading extends CoinState {}

/// Coin has loaded successfully
class CoinLoadSuccess extends CoinState {
  /// Received coin
  final Coin coin;

  /// Accepts [Coin] into constructor
  CoinLoadSuccess({required this.coin});
}

/// Coin load failed state
class CoinLoadFailed extends CoinState {}