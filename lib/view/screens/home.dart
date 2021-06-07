import 'package:wear/wear.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/coin/coin_bloc.dart';
import '../../core/models/coin.dart';
import '../components/coin_info.dart';
import '../components/coin_logo.dart';
import '../components/reload_button.dart';
import '../themes/colors.dart';

/// Home screen.
/// Shows [CoinInfo] and [CoinState].
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ThemeColors().blackLightGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _layout(),
      ),
    );
  }

  Widget _layout() {
    return BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          return AmbientMode(
            builder: (context, mode, _) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: _getCoinStatusColor(state, mode),
                        width: 3
                    ),
                ),
                child: Center(
                  child: WatchShape(
                    builder: (context, shape, child) {
                      return _coinInfo(state);
                    },
                  ),
                ),
              );
            },
          );
        });
  }

  Widget _coinInfo(CoinState state) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      child: _coinInfoLayout(state),
    );
  }

  Widget _coinInfoLayout(CoinState state) {
    if (state is CoinLoadSuccess) {
      return _loadingSuccessLayout(state);
    } else if (state is CoinLoadFailed) {
      return _loadingFailedLayout();
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    }
  }

  Widget _loadingSuccessLayout(CoinLoadSuccess state) {
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

  Widget _loadingFailedLayout() {
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

  Color _getCoinStatusColor(CoinState state, WearMode mode) {
    if (state is CoinLoadSuccess) {
      if (mode == WearMode.ambient) {
        return state.coin.coinPriceTrend == CoinPriceTrend.rise
            ? Colors.white.withOpacity(0.8)
            : Colors.grey.withOpacity(0.5);
      } else {
        return state.coin.coinPriceTrend == CoinPriceTrend.rise
            ? Colors.green.withOpacity(0.8)
            : Colors.red.withOpacity(0.8);
      }
    } else {
      return Colors.transparent;
    }
  }
}
