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
          return AmbientMode(
            builder: (context, mode, _) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: getCoinStatusColor(state, mode), width: 3)
                ),
                child: Center(
                  child: WatchShape(
                    builder: (context, shape, child) {
                      return coinInfo(state);
                    },
                  ),
                ),
              );
            },
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
      return loadingSuccessLayout(state);
    } else if (state is CoinLoadFailed) {
      return loadingFailedLayout();
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  Widget loadingSuccessLayout(CoinLoadSuccess state) {
    return Stack(
      children: [
        Align(
            alignment: Alignment(0, -0.75),
            child: CoinLogo(coin: state.coin)
        ),
        Center(child: CoinInfo(coin: state.coin)),
      ],
    );
  }

  Widget loadingFailedLayout() {
    return Stack(
      children: [
        Center(child: ReloadButton()),
        Container(
          alignment: Alignment(0, 0.5),
          child: Text(
            'Failed to load',
          ),
        ),
      ],
    );
  }

  Color getCoinStatusColor(CoinState state, WearMode mode) {
    if (state is CoinLoadSuccess) {
      if (mode == WearMode.ambient) {
        return state.coin.coinStatus == CoinStatus.up
            ? Colors.white.withOpacity(0.8)
            : Colors.grey.withOpacity(0.5);
      } else {
        return state.coin.coinStatus == CoinStatus.up
            ? Colors.green.withOpacity(0.8)
            : Colors.red.withOpacity(0.8);
      }
    } else {
      return Colors.transparent;
    }
  }
}
