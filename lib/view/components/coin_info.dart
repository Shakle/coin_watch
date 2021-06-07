import 'package:flutter/material.dart';
import '../../core/models/coin.dart';

/// Coin information widget.
/// Shows name, price, image of the coin.
class CoinInfo extends StatelessWidget {
  /// The coin to show.
  final Coin coin;

  /// Accepts [Coin].
  const CoinInfo({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _coinName(),
        SizedBox(height: 5),
        _coinPrice(),
      ],
    );
  }

  Widget _coinName() {
    return Text(
      coin.name.toUpperCase(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _coinPrice() {
    return Text(
      '\$${coin.price.toStringAsFixed(3)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
    );
  }
}
