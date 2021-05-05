import '../../models/coin.dart';

class CoinState {}

class CoinInitial extends CoinState {}
class CoinLoading extends CoinState {}

class CoinLoadSuccess extends CoinState {
  final Coin coin;
  CoinLoadSuccess({required this.coin});
}

class CoinLoadFailed extends CoinState {}