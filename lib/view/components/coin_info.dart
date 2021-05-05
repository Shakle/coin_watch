import 'package:flutter/material.dart';
import '../../core/models/coin.dart';

class CoinInfo extends StatelessWidget {
  final Coin coin;

  const CoinInfo({required this.coin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        coinName(),
        SizedBox(height: 5),
        coinPrice(),
      ],
    );
  }

  Widget coinName() {
    return Text(
      coin.symbol.toUpperCase(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget coinPrice() {
    return Text(
      '\$${coin.price.toStringAsFixed(2)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500
      ),
    );
  }
}
