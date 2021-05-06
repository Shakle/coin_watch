import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/coin/coin_bloc.dart';
import '../../core/bloc/coin/coin_event.dart';

class ReloadButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return reloadButton(context: context);
  }

  Widget reloadButton({required BuildContext context}) {
    return IconButton(
        icon: Icon(Icons.refresh),
        iconSize: 40,
        onPressed: () => reloadCoinInfo(context)
    );
  }

  void reloadCoinInfo(BuildContext context) {
    BlocProvider.of<CoinBloc>(context).add(CoinRequested());
  }
}
