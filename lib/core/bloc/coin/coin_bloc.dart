import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/coin.dart';
import '../../repositories/coin_repo.dart';

part 'coin_event.dart';
part 'coin_state.dart';

/// Coin state manager
class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepo _coinRepo = CoinRepo();
  StreamSubscription? _coinPriceStreamSubscription;

  /// Sets initial state
  CoinBloc() : super(CoinInitial()) {
    initState();
  }

  /// Requests a coin on creation
  void initState() {
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
        yield await _handleError(e);
      }
    } else if (event is CoinRequested) {
      yield CoinLoading();
      try {
        final Stream coinPriceStream = _coinRepo.getCoinPriceStream();
        await _listenToCoinPriceStream(coinPriceStream);
      } on Exception catch (e) {
        yield await _handleError(e);
      }
    } else {
      throw UnimplementedError();
    }
  }

  Future<CoinLoadFailed> _handleError(Exception e) async {
    debugPrint(e.toString());
    await _coinPriceStreamSubscription?.cancel();
    return CoinLoadFailed();
  }

  Future<void> _listenToCoinPriceStream(Stream coinPriceStream) async {
    await _coinPriceStreamSubscription?.cancel();
    coinPriceStream.listen((json) {
      add(CoinReceived(json: json));
    });
  }

  @override
  Future<void> close() async {
    await _coinPriceStreamSubscription?.cancel();
    super.close();
  }

}