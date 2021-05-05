import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/coin.dart';
import '../../repositories/coin_repo.dart';
import 'coin_event.dart';
import 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepo _coinRepo = CoinRepo();

  CoinBloc() : super(CoinInitial()) {
    if (state is CoinInitial) {
      add(CoinRequested());
    }
  }

  @override
  Stream<CoinState> mapEventToState(CoinEvent event) async* {
    if (event is CoinRequested) {
      yield CoinLoading();
      try {
        final Coin? coin = await _coinRepo.getCoin();
        if (coin == null) {
          yield CoinLoadFailed();
        } else {
          yield CoinLoadSuccess(coin: _coinRepo.getCoinWithUpdatedStatus(coin));
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        yield CoinLoadFailed();
      }
    } else {
      throw UnimplementedError();
    }
  }

}