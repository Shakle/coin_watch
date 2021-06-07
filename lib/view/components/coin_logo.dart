import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/models/coin.dart';

/// Coin logo / image.
class CoinLogo extends StatelessWidget {
  /// Coin object to take logo info from.
  final Coin coin;

  /// Accepts [Coin] to get the logo link.
  const CoinLogo({required this.coin});

  @override
  Widget build(BuildContext context) {
    return _coinLogo(context);
  }

  Widget _coinLogo(BuildContext context) {
    return SvgPicture.asset(
        coin.iconImageUrl,
        color: Colors.white,
        width: 25,
        height: 25,
    );
  }
}
