// ignore: import_of_legacy_library_into_null_safe
import 'package:wear/wear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/coin/coin_bloc.dart';
import '../../core/bloc/coin/coin_state.dart';
import '../../core/models/coin.dart';
import '../components/coin_info.dart';
import '../components/coin_logo.dart';
import '../components/reload_button.dart';
import '../themes/colors.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ThemeColors().blackLightGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: layout(),
      ),
    );
  }

  Widget layout() {
    return BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: getCoinStatusColor(state), width: 3)
            ),
            child: Center(
              child: WatchShape(
                builder: (context, shape, child) {
                  return coinInfo(state);
                },
                // child: ambientModeLayout(),
              ),
            ),
          );
        });
  }

  Widget coinInfo(CoinState state) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      child: coinInfoLayout(state),
    );
  }

  Widget coinInfoLayout(CoinState state) {
    if (state is CoinLoadSuccess) {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CoinLogo(coin: state.coin),
            CoinInfo(coin: state.coin),
            ReloadButton(),
          ],
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  Color getCoinStatusColor(CoinState state) {
    if (state is CoinLoadSuccess && state.coin.coinStatus != CoinStatus.flat) {
      return state.coin.coinStatus == CoinStatus.up
          ? Colors.green.withOpacity(0.8)
          : Colors.red.withOpacity(0.8);
    } else {
      return Colors.transparent;
    }
  }
  // Widget ambientModeLayout() {
  //   return AmbientMode(
  //     builder: (context, mode, child) {
  //       return Text(
  //         '\$3.30\n\nХЕЛОУ ВОРЛД!!',
  //         textAlign: TextAlign.center,
  //       );
  //     },
  //   );
  // }
}
