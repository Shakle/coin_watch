import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/coin/coin_bloc.dart';
import 'coin_info.dart';

/// [CoinInfo] reload button.
/// Used to reload the interface by sending coin info API request.
class ReloadButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _reloadButton(context: context);
  }

  Widget _reloadButton({required BuildContext context}) {
    return IconButton(
        icon: Icon(Icons.refresh),
        iconSize: 40,
        onPressed: () => _reloadCoinInfo(context)
    );
  }

  /// Sends [CoinRequested] event to [CoinBloc] to receive new [Coin].
  void _reloadCoinInfo(BuildContext context) {
    BlocProvider.of<CoinBloc>(context).add(CoinRequested());
  }
}
