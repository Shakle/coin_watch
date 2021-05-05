import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/models/coin.dart';

class CoinLogo extends StatelessWidget {
  final Coin coin;

  const CoinLogo({required this.coin});

  @override
  Widget build(BuildContext context) {
    return coinLogo(context);
  }

  Widget coinLogo(BuildContext context) {
    return SvgPicture.asset(
        coin.iconUrl,
        color: Colors.white,
        width: 25,
        height: 25,
    );
  }
}
