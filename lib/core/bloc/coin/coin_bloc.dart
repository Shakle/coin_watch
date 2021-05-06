import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/coin.dart';
import '../../repositories/coin_repo.dart';
import 'coin_event.dart';
import 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepo _coinRepo = CoinRepo();
  StreamSubscription? coinPriceStreamSubscription;

  CoinBloc() : super(CoinInitial()) {
    if (state is CoinInitial) {
      add(CoinRequested());
    }
  }

  @override
  Stream<CoinState> mapEventToState(CoinEvent event) async* {
    if (event is CoinReceived) {
      try {
        final Coin coin = Coin.fromJson(jsonDecode(event.json));
        yield CoinLoadSuccess(coin: coin);
      } on Exception catch (e) {
        yield await handleError(e);
      }
    } else if (event is CoinRequested) {
      yield CoinLoading();
      try {
        final Stream coinPriceStream = _coinRepo.getCoinPriceStream();
        await listenToCoinPriceStream(coinPriceStream);
      } on Exception catch (e) {
        yield await handleError(e);
      }
    } else {
      throw UnimplementedError();
    }
  }

  Future<CoinLoadFailed> handleError(Exception e) async {
    debugPrint(e.toString());
    await coinPriceStreamSubscription?.cancel();
    return CoinLoadFailed();
  }

  Future<void> listenToCoinPriceStream(Stream coinPriceStream) async {
    await coinPriceStreamSubscription?.cancel();
    coinPriceStream.listen((json) {
      add(CoinReceived(json: json));
    });
  }

}